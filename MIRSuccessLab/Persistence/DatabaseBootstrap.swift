import Foundation

struct DatabaseBootstrap {
    let migrator: DatabaseMigrator

    func openDefaultDatabase() throws -> SQLiteStore {
        let directory = try FileManager.default.url(
            for: .applicationSupportDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        ).appendingPathComponent("MIRSuccessLab", isDirectory: true)

        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)

        let url = directory.appendingPathComponent("success-lab.sqlite")
        let store = SQLiteStore()
        try store.open(at: url)
        try migrator.migrate(store)
        return store
    }
}
