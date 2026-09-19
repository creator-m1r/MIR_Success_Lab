import Foundation

actor DatasetService {
    private let store: SQLiteStore

    init(store: SQLiteStore) {
        self.store = store
    }

    func createDataset(projectID: UUID, name: String) throws -> Dataset {
        let normalized = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalized.isEmpty else { throw DatasetServiceError.emptyName }

        let dataset = Dataset(projectID: projectID, name: normalized)
        let id = dataset.id.rawValue.uuidString
        let project = projectID.uuidString
        let escapedName = normalized.replacingOccurrences(of: "'", with: "''")
        let date = ISO8601DateFormatter().string(from: dataset.createdAt)

        try store.execute("""
        INSERT INTO datasets(id, project_id, name, version, created_at)
        VALUES ('(id)', '(project)', '(escapedName)', (dataset.version), '(date)');
        """)
        return dataset
    }
}

enum DatasetServiceError: LocalizedError {
    case emptyName
    var errorDescription: String? { "Название набора данных не может быть пустым." }
}
