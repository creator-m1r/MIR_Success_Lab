#pragma once
#include <cstdint>

namespace mir::success {

enum class EngineStatus : std::uint8_t {
    ok = 0,
    invalidArgument = 1,
    internalError = 2
};

} // namespace mir::success
