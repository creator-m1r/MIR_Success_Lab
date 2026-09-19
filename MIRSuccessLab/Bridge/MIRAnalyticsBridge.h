#pragma once
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct MirEngineHandleOpaque* MirEngineHandle;

typedef struct {
    uint32_t abiVersion;
    uint32_t major;
    uint32_t minor;
    uint32_t patch;
} MirEngineInfo;

typedef enum {
    MIR_ENGINE_OK = 0,
    MIR_ENGINE_INVALID_ARGUMENT = 1,
    MIR_ENGINE_INTERNAL_ERROR = 2
} MirEngineResult;

MirEngineResult mir_engine_create(MirEngineHandle* outHandle);
void mir_engine_destroy(MirEngineHandle handle);
MirEngineResult mir_engine_get_info(MirEngineHandle handle, MirEngineInfo* outInfo);
MirEngineResult mir_engine_health_check(MirEngineHandle handle);

#ifdef __cplusplus
}
#endif
