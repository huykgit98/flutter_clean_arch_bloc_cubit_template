/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-2020 Datadog, Inc.
 */

import Foundation

/// Synchronizes the work of `FileReader` on given read/write queue.
internal final class DataReader: SyncReader {
    /// Queue used to synchronize reads and writes for the feature.
    internal let queue: DispatchQueue
    private let fileReader: Reader

    init(readWriteQueue: DispatchQueue, fileReader: Reader) {
        self.queue = readWriteQueue
        self.fileReader = fileReader
    }

    func readNextBatch() -> Batch? {
        queue.sync {
            self.fileReader.readNextBatch()
        }
    }

    func markBatchAsRead(_ batch: Batch) {
        queue.sync {
            self.fileReader.markBatchAsRead(batch)
        }
    }
}
