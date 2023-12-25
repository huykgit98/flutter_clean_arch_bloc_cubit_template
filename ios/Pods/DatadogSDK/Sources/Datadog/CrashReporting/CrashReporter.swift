/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-2020 Datadog, Inc.
 */

import Foundation

internal class CrashReporter {
    /// Queue for synchronizing internal operations.
    private let queue: DispatchQueue

    /// An interface for accessing the `DDCrashReportingPlugin` from `DatadogCrashReporting`.
    let plugin: DDCrashReportingPluginType
    /// Integration enabling sending crash reports as Logs or RUM Errors.
    let loggingOrRUMIntegration: CrashReportingIntegration

    let crashContextProvider: CrashContextProviderType

    // MARK: - Initialization

    convenience init?(
        crashReportingFeature: CrashReportingFeature,
        loggingFeature: LoggingFeature?,
        rumFeature: RUMFeature?,
        context: DatadogV1Context
    ) {
        let loggingOrRUMIntegration: CrashReportingIntegration?

        // If RUM rum is enabled prefer it for sending crash reports, otherwise use Logging feature.
        if let rumFeature = rumFeature {
            loggingOrRUMIntegration = CrashReportingWithRUMIntegration(rumFeature: rumFeature, context: context)
        } else if let loggingFeature = loggingFeature {
            loggingOrRUMIntegration = CrashReportingWithLoggingIntegration(loggingFeature: loggingFeature, context: context)
        } else {
            loggingOrRUMIntegration = nil
        }

        guard let availableLoggingOrRUMIntegration = loggingOrRUMIntegration else {
            // This case is not reachable in higher abstraction but we add sanity warning.
            DD.logger.error(
                """
                In order to use Crash Reporting, RUM or Logging feature must be enabled.
                Make sure `.enableRUM(true)` or `.enableLogging(true)` are configured
                when initializing Datadog SDK.
                """
            )
            return nil
        }

        self.init(
            crashReportingPlugin: crashReportingFeature.configuration.crashReportingPlugin,
            crashContextProvider: CrashContextProvider(
                consentProvider: crashReportingFeature.consentProvider,
                userInfoProvider: crashReportingFeature.userInfoProvider,
                networkConnectionInfoProvider: crashReportingFeature.networkConnectionInfoProvider,
                carrierInfoProvider: crashReportingFeature.carrierInfoProvider,
                rumViewEventProvider: crashReportingFeature.rumViewEventProvider,
                rumSessionStateProvider: crashReportingFeature.rumSessionStateProvider,
                appStateListener: crashReportingFeature.appStateListener
            ),
            loggingOrRUMIntegration: availableLoggingOrRUMIntegration
        )
    }

    init(
        crashReportingPlugin: DDCrashReportingPluginType,
        crashContextProvider: CrashContextProviderType,
        loggingOrRUMIntegration: CrashReportingIntegration
    ) {
        self.queue = DispatchQueue(
            label: "com.datadoghq.crash-reporter",
            target: .global(qos: .utility)
        )
        self.plugin = crashReportingPlugin
        self.loggingOrRUMIntegration = loggingOrRUMIntegration
        self.crashContextProvider = crashContextProvider

        // Inject current `CrashContext`
        self.inject(currentCrashContext: crashContextProvider.currentCrashContext)

        // Register for future `CrashContext` changes
        self.crashContextProvider.onCrashContextChange = { [weak self] newCrashContext in
            guard let self = self else {
                return
            }
            self.inject(currentCrashContext: newCrashContext)
        }
    }

    // MARK: - Interaction with `DatadogCrashReporting` plugin

    func sendCrashReportIfFound() {
        queue.async {
            self.plugin.readPendingCrashReport { [weak self] crashReport in
                guard let self = self, let availableCrashReport = crashReport else {
                    DD.logger.debug("No pending crash available")
                    return false
                }

                DD.logger.debug("Loaded pending crash report")

                guard let crashContext = availableCrashReport.context.flatMap({ self.decode(crashContextData: $0) }) else {
                    // `CrashContext` is malformed and and cannot be read. Return `true` to let the crash reporter
                    // purge this crash report as we are not able to process it respectively.
                    return true
                }

                self.loggingOrRUMIntegration.send(crashReport: availableCrashReport, with: crashContext)
                return true
            }
        }
    }

    private func inject(currentCrashContext: CrashContext) {
        queue.async {
            if let crashContextData = self.encode(crashContext: currentCrashContext) {
                self.plugin.inject(context: crashContextData)
            }
        }
    }

    // MARK: - CrashContext Encoding and Decoding

    /// JSON encoder used for writing `CrashContext` into JSON `Data` injected to crash report.
    /// Note: this `JSONEncoder` must have the same configuration as the `JSONEncoder` used later for writing payloads to uploadable files.
    /// Otherwise the format of data read and uploaded from crash report context will be different than the format of data retrieved from the user
    /// and written directly to uploadable file.
    private let crashContextEncoder: JSONEncoder = .default()
    /// JSON decoder used for reading `CrashContext` from JSON `Data` injected to crash report. 
    private let crashContextDecoder = JSONDecoder()

    private func encode(crashContext: CrashContext) -> Data? {
        do {
            return try crashContextEncoder.encode(crashContext)
        } catch {
            DD.logger.error(
                """
                Failed to encode crash report context. The app state information associated with eventual crash
                report may be not in sync with the current state of the application.
                """,
                error: error
            )

            DD.telemetry.error("Failed to encode crash report context", error: error)
            return nil
        }
    }

    private func decode(crashContextData: Data) -> CrashContext? {
        do {
            return try crashContextDecoder.decode(CrashContext.self, from: crashContextData)
        } catch {
            DD.logger.error(
                """
                Failed to decode crash report context. The app state information associated with the crash
                report won't be in sync with the state of the application when it crashed.
                """,
                error: error
            )
            DD.telemetry.error("Failed to decode crash report context", error: error)
            return nil
        }
    }

    internal func deinitialize() {
        // Await asynchronous operations completion to safely sink all pending tasks.
        queue.sync {}
    }
}
