import Foundation

public struct PersonID: Hashable, Codable, Sendable { public let rawValue: UUID; public init(_ rawValue: UUID = UUID()) { self.rawValue = rawValue } }
public struct DatasetID: Hashable, Codable, Sendable { public let rawValue: UUID; public init(_ rawValue: UUID = UUID()) { self.rawValue = rawValue } }
public struct StudyID: Hashable, Codable, Sendable { public let rawValue: UUID; public init(_ rawValue: UUID = UUID()) { self.rawValue = rawValue } }
public struct VariableID: Hashable, Codable, Sendable { public let rawValue: UUID; public init(_ rawValue: UUID = UUID()) { self.rawValue = rawValue } }
public struct ObservationID: Hashable, Codable, Sendable { public let rawValue: UUID; public init(_ rawValue: UUID = UUID()) { self.rawValue = rawValue } }
public struct ModelID: Hashable, Codable, Sendable { public let rawValue: UUID; public init(_ rawValue: UUID = UUID()) { self.rawValue = rawValue } }
public struct ScenarioID: Hashable, Codable, Sendable { public let rawValue: UUID; public init(_ rawValue: UUID = UUID()) { self.rawValue = rawValue } }
public struct TrajectoryID: Hashable, Codable, Sendable { public let rawValue: UUID; public init(_ rawValue: UUID = UUID()) { self.rawValue = rawValue } }
public struct ReportID: Hashable, Codable, Sendable { public let rawValue: UUID; public init(_ rawValue: UUID = UUID()) { self.rawValue = rawValue } }
