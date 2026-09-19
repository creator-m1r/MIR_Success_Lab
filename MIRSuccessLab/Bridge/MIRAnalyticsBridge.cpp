#include "MIRAnalyticsBridge.h"
#include "../../Engine/MIRAnalyticsEngine.hpp"

struct MirEngineHandleOpaque {
    mir::success::MIRAnalyticsEngine engine;
};

extern "C" MirEngineResult mir_engine_create(MirEngineHandle* outHandle) {
    if (outHandle == nullptr) return MIR_ENGINE_INVALID_ARGUMENT;
    *outHandle = new MirEngineHandleOpaque{};
    return MIR_ENGINE_OK;
}

extern "C" void mir_engine_destroy(MirEngineHandle handle) {
    delete handle;
}

extern "C" MirEngineResult mir_engine_get_info(MirEngineHandle handle, MirEngineInfo* outInfo) {
    if (handle == nullptr || outInfo == nullptr) return MIR_ENGINE_INVALID_ARGUMENT;
    const auto info = handle->engine.info();
    outInfo->abiVersion = info.abiVersion;
    outInfo->major = info.major;
    outInfo->minor = info.minor;
    outInfo->patch = info.patch;
    return MIR_ENGINE_OK;
}

extern "C" MirEngineResult mir_engine_health_check(MirEngineHandle handle) {
    if (handle == nullptr) return MIR_ENGINE_INVALID_ARGUMENT;
    return static_cast<MirEngineResult>(handle->engine.healthCheck());
}
