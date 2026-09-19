#pragma once
#include "Core/EngineInfo.hpp"
#include "Core/EngineStatus.hpp"

namespace mir::success {

class MIRAnalyticsEngine final {
public:
    [[nodiscard]] EngineInfo info() const noexcept;
    [[nodiscard]] EngineStatus healthCheck() const noexcept;
};

} // namespace mir::success
