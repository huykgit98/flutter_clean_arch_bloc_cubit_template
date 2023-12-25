/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-2020 Datadog, Inc.
 */

import Foundation

/// The `HTTPHeadersWriter` should be used to inject trace propagation headers to
/// the network requests send to the backend instrumented with Datadog APM.
///
/// Usage:
///
///     var request = URLRequest(...)
///
///     let writer = HTTPHeadersWriter()
///     let span = Global.sharedTracer.startSpan("network request")
///     writer.inject(spanContext: span.context)
///
///     writer.tracePropagationHTTPHeaders.forEach { (field, value) in
///         request.setValue(value, forHTTPHeaderField: field)
///     }
///
///     // call span.finish() when the request completes
///
///
public class HTTPHeadersWriter: OTHTTPHeadersWriter {
    /// A dictionary with HTTP Headers required to propagate the trace started in the mobile app
    /// to the backend instrumented with Datadog APM.
    ///
    /// Usage:
    ///
    ///     writer.tracePropagationHTTPHeaders.forEach { (field, value) in
    ///         request.setValue(value, forHTTPHeaderField: field)
    ///     }
    ///
    public private(set) var tracePropagationHTTPHeaders: [String: String] = [:]

    /// The tracing sampler.
    ///
    /// This value will decide of the `x-datadog-sampling-priority` header field value
    /// and if `x-datadog-trace-id` and `x-datadog-parent-id` are propagated.
    private let sampler: Sampler

    /// Creates a `HTTPHeadersWriter` to inject traces propagation headers
    /// to network request.
    ///
    /// - Parameter samplingRate: Tracing sampling rate. 20% by default.
    public init(samplingRate: Float = 20) {
        self.sampler = Sampler(samplingRate: samplingRate)
    }

    /// Creates a `HTTPHeadersWriter` to inject traces propagation headers
    /// to network request.
    ///
    /// - Parameter samplingRate: Tracing sampling rate. 100% (keep all) by default.
    internal init(sampler: Sampler) {
        self.sampler = sampler
    }

    public func inject(spanContext: OTSpanContext) {
        guard let spanContext = spanContext.dd else {
            return
        }

        let samplingPriority = sampler.sample()

        tracePropagationHTTPHeaders = [
            TracingHTTPHeaders.samplingPriorityField: samplingPriority ? "1" : "0"
        ]

        if samplingPriority {
            tracePropagationHTTPHeaders[TracingHTTPHeaders.traceIDField] = String(spanContext.traceID.rawValue)
            tracePropagationHTTPHeaders[TracingHTTPHeaders.parentSpanIDField] = String(spanContext.spanID.rawValue)
        }
    }
}
