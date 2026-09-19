# Implementation Plan

## Goal

Turn the documented MIR Success Lab architecture into the first buildable macOS application without coupling UI code to the statistical engine.

## Phase 1 — Repository and build foundation

Create:

```
MIRSuccessLab/
├── App/
├── Application/
├── Domain/
├── Persistence/
├── Bridge/
├── Engine/
├── Resources/
└── Tests/
```

The exact Xcode target layout may differ, but responsibilities must remain separated.

## Phase 2 — Swift application shell

Implement:

- App entry point;
- main window;
- navigation shell;
- project/database bootstrap;
- application dependency container;
- error presentation;
- command/menu infrastructure.

The first screen should communicate that the application is ready for research rather than displaying fake statistics.

## Phase 3 — C++26 engine

Implement:

- engine version;
- health check;
- operation status;
- error model;
- cancellation token;
- deterministic execution metadata;
- minimal dataset validation.

Do not implement advanced statistics in the foundation commit.

## Phase 4 — Bridge

Create a narrow C-compatible ABI boundary.

The bridge should expose opaque engine handles and serialized request/result payloads.

Rules:

- no C++ exceptions across ABI;
- no SwiftUI dependency;
- no direct exposure of STL types;
- explicit ownership;
- explicit UTF-8 encoding;
- explicit error codes.

## Phase 5 — SQLite

Implement:

- database bootstrap;
- schema version;
- migrations;
- WAL;
- foreign keys;
- transaction helper;
- project metadata;
- dataset metadata.

Raw observations can be added in the Data Lab phase.

## Phase 6 — Integration

The first end-to-end operation:

```
Launch
→ bootstrap SQLite
→ create/open project
→ initialize engine
→ engineInfo
→ validateDataset
→ persist result
→ display status
```

## Phase 7 — Tests

Required:

- Swift unit tests;
- C++ unit tests;
- bridge tests;
- SQLite migration tests;
- integration test.

The integration test must prove that Swift, the bridge, C++ and SQLite cooperate in one execution.

## Definition of Done

The application builds and launches on the target macOS environment, creates its local database, initializes C++26, crosses the ABI boundary, executes a deterministic health check, persists metadata, and passes automated tests.

No advanced research feature is considered required for this milestone.
