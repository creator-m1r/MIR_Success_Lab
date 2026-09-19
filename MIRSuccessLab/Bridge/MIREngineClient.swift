import Foundation
import MIRAnalyticsBridge

struct MIREngineClient: Sendable {
    enum ClientError: Error {
        case createFailed(Int32)
        case infoFailed(Int32)
        case healthCheckFailed(Int32)
    }

    func healthCheck() throws -> MirEngineInfo {
        var handle: MirEngineHandle?
        let createResult = mir_engine_create(&handle)
        guard createResult == MIR_ENGINE_OK, let handle else {
            throw ClientError.createFailed(Int32(createResult.rawValue))
        }
        defer { mir_engine_destroy(handle) }

        var info = MirEngineInfo()
        let infoResult = mir_engine_get_info(handle, &info)
        guard infoResult == MIR_ENGINE_OK else {
            throw ClientError.infoFailed(Int32(infoResult.rawValue))
        }

        let healthResult = mir_engine_health_check(handle)
        guard healthResult == MIR_ENGINE_OK else {
            throw ClientError.healthCheckFailed(Int32(healthResult.rawValue))
        }

        return info
    }
}
