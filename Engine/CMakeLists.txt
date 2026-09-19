cmake_minimum_required(VERSION 3.28)

project(MIRSuccessLabEngine LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(MIRSuccessLabEngine STATIC
    Core/EngineInfo.cpp
    Core/EngineStatus.cpp
    MIRAnalyticsEngine.cpp
    ../MIRSuccessLab/Bridge/MIRAnalyticsBridge.cpp
)

target_include_directories(MIRSuccessLabEngine PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/../MIRSuccessLab/Bridge
)

target_compile_features(MIRSuccessLabEngine PUBLIC cxx_std_26)
