import Foundation

actor ProjectService {
    private let repository: ProjectRepository

    init(repository: ProjectRepository) {
        self.repository = repository
    }

    func createProject(name: String) throws -> Project {
        let normalized = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalized.isEmpty else {
            throw ProjectServiceError.emptyName
        }

        let project = Project(name: normalized)
        try repository.save(project)
        return project
    }
}

enum ProjectServiceError: LocalizedError {
    case emptyName

    var errorDescription: String? {
        switch self {
        case .emptyName: "Название проекта не может быть пустым."
        }
    }
}
