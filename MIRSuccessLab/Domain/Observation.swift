import Foundation

enum ObservationValue: Codable, Hashable, Sendable {
    case number(Double)
    case text(String)
    case boolean(Bool)
    case date(Date)
    case missing

    private enum CodingKeys: String, CodingKey { case type, number, text, boolean, date }
    private enum ValueType: String, Codable { case number, text, boolean, date, missing }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(ValueType.self, forKey: .type)
        switch type {
        case .number: self = .number(try container.decode(Double.self, forKey: .number))
        case .text: self = .text(try container.decode(String.self, forKey: .text))
        case .boolean: self = .boolean(try container.decode(Bool.self, forKey: .boolean))
        case .date: self = .date(try container.decode(Date.self, forKey: .date))
        case .missing: self = .missing
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .number(let value):
            try container.encode(ValueType.number, forKey: .type); try container.encode(value, forKey: .number)
        case .text(let value):
            try container.encode(ValueType.text, forKey: .type); try container.encode(value, forKey: .text)
        case .boolean(let value):
            try container.encode(ValueType.boolean, forKey: .type); try container.encode(value, forKey: .boolean)
        case .date(let value):
            try container.encode(ValueType.date, forKey: .type); try container.encode(value, forKey: .date)
        case .missing:
            try container.encode(ValueType.missing, forKey: .type)
        }
    }
}

struct Observation: Identifiable, Codable, Hashable, Sendable {
    let id: ObservationID
    let personID: PersonID
    let variableID: VariableID
    let timestamp: Date?
    let value: ObservationValue
    let source: String?
}
