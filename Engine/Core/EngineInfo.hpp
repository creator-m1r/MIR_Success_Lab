#pragma once
#include <cstdint>

namespace mir::success {

struct EngineInfo final {
    std::uint32_t abiVersion {1};
    std::uint32_t major {0};
    std::uint32_t minor {1};
    std::uint32_t patch {0};
};

} // namespace mir::success
