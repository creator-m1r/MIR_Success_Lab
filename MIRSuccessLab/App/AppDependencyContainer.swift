import Foundation

@MainActor
final class AppDependencyContainer {
    let database: SQLiteStore
    let projectService: ProjectService
    let analyticsService: AnalyticsService

    init() throws {
        let store = try DatabaseBootstrap(migrator: DatabaseMigrator()).openDefaultDatabase()
        database = store
        projectService = ProjectService(repository: ProjectRepository(store: store))
        analyticsService = AnalyticsService()
    }
}
