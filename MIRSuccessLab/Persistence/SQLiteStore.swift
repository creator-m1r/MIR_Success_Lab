import Foundation
import SQLite3

final class SQLiteStore: @unchecked Sendable {
    private var database: OpaquePointer?
    private let lock = NSLock()

    deinit { close() }

    func open(at url: URL) throws {
        lock.lock()
        defer { lock.unlock() }

        if database != nil { return }

        var handle: OpaquePointer?
        let result = sqlite3_open_v2(
            url.path,
            &handle,
            SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE | SQLITE_OPEN_FULLMUTEX,
            nil
        )

        guard result == SQLITE_OK, let handle else {
            let message = handle.flatMap { String(cString: sqlite3_errmsg($0)) } ?? "SQLite open failed"
            if let handle { sqlite3_close(handle) }
            throw SQLiteStoreError.openFailed(message)
        }

        database = handle
        try execute("PRAGMA foreign_keys = ON;")
        try execute("PRAGMA journal_mode = WAL;")
    }

    func execute(_ sql: String) throws {
        guard let database else { throw SQLiteStoreError.notOpen }

        var errorPointer: UnsafeMutablePointer<CChar>?
        let result = sqlite3_exec(database, sql, nil, nil, &errorPointer)

        guard result == SQLITE_OK else {
            let message = errorPointer.map { String(cString: $0) } ?? "SQLite execution failed"
            sqlite3_free(errorPointer)
            throw SQLiteStoreError.executionFailed(message)
        }
    }

    func close() {
        lock.lock()
        defer { lock.unlock() }

        guard let database else { return }
        sqlite3_close(database)
        self.database = nil
    }
}

enum SQLiteStoreError: LocalizedError {
    case notOpen
    case openFailed(String)
    case executionFailed(String)

    var errorDescription: String? {
        switch self {
        case .notOpen: "SQLite database is not open."
        case .openFailed(let message): "SQLite open failed: \(message)"
        case .executionFailed(let message): "SQLite execution failed: \(message)"
        }
    }
}
