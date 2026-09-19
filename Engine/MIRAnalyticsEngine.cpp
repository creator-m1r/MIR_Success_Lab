#include "MIRAnalyticsEngine.hpp"

namespace mir::success {

EngineInfo MIRAnalyticsEngine::info() const noexcept {
    return {};
}

EngineStatus MIRAnalyticsEngine::healthCheck() const noexcept {
    return EngineStatus::ok;
}

} // namespace mir::success
