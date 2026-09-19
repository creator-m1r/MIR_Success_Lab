import Foundation

enum VariableType: String, Codable, Sendable {
    case continuous
    case discrete
    case categorical
    case ordinal
    case binary
    case dateTime
    case duration
    case text
}

struct VariableDefinition: Identifiable, Codable, Hashable, Sendable {
    let id: VariableID
    var name: String
    var description: String
    var type: VariableType
    var unit: String?
    var nullable: Bool

    init(id: VariableID = VariableID(), name: String, description: String = "", type: VariableType, unit: String? = nil, nullable: Bool = true) {
        self.id = id
        self.name = name
        self.description = description
        self.type = type
        self.unit = unit
        self.nullable = nullable
    }
}

struct Dataset: Identifiable, Codable, Hashable, Sendable {
    let id: DatasetID
    let projectID: UUID
    var name: String
    let version: Int
    let createdAt: Date
    var variables: [VariableDefinition]

    init(id: DatasetID = DatasetID(), projectID: UUID, name: String, version: Int = 1, createdAt: Date = .now, variables: [VariableDefinition] = []) {
        self.id = id
        self.projectID = projectID
        self.name = name
        self.version = version
        self.createdAt = createdAt
        self.variables = variables
    }
}
