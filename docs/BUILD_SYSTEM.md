# Build System

## Foundation

MIR Success Lab is designed as a native macOS application with:

- SwiftUI for the application and presentation layer;
- C++26 for the analytical engine;
- a narrow C ABI for Swift ↔ C++ communication;
- SQLite for local persistence.

The repository deliberately keeps the engine independent from the SwiftUI application so that numerical code can be tested and built separately.

## Current repository state

The current milestone establishes source-level foundations:

- SwiftUI application shell;
- domain identifiers and project model;
- C ABI bridge;
- initial C++26 engine API;
- CMake build definition for the engine;
- Swift bridge client.

The Xcode application target and SQLite persistence target are the next integration layer. The source scaffold should not be considered a finished distributable .app until the Xcode target, signing/build settings, SQLite layer and automated integration tests are present.

## C++ engine

From the repository root:

~~~text
cmake -S Engine -B build/engine
cmake --build build/engine
~~~

The engine requires a compiler/toolchain with C++26 support.

## Xcode integration

The Xcode target should:

1. compile the SwiftUI sources;
2. compile the C++ engine sources;
3. expose MIRSuccessLab/Bridge/MIRAnalyticsBridge.h as a C module;
4. make MIRSuccessLab/Bridge/module.modulemap available to the Swift target;
5. link the engine implementation into the application target;
6. keep the C ABI boundary free of SwiftUI, Foundation, STL and C++ exception types.

Do not add Objective-C objects or Objective-C business logic to the application layer merely to cross the bridge.

## Verification

The first integration test must prove:

SwiftUI launch → engine creation → engine info → health check → engine destruction

Later milestones add:

SQLite bootstrap → project creation → dataset registration → analysis request → deterministic result → persistence → report.

## Important limitation

This document describes the intended build integration. It does not claim that an Xcode project has already been generated or compiled in this repository.
