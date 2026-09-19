import Foundation

struct ProjectRepository: Sendable {
    private let store: SQLiteStore

    init(store: SQLiteStore) {
        self.store = store
    }

    func save(_ project: Project) throws {
        let id = project.id.uuidString
        let name = project.name.replacingOccurrences(of: "'", with: "''")
        let date = ISO8601DateFormatter().string(from: project.createdAt)

        try store.execute("""
        INSERT OR REPLACE INTO projects(id, name, created_at)
        VALUES ('\(id)', '\(name)', '\(date)');
        """)
    }
}
