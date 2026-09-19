# Database Specification

## Principles

MIR Success Lab uses a local SQLite database as the authoritative local persistence layer.

Requirements:

- foreign keys enabled;
- WAL journal mode;
- schema migrations are versioned;
- writes occur through repositories/services rather than SwiftUI views;
- imported dataset versions are immutable after commitment;
- destructive migrations require an explicit migration;
- database errors are surfaced as actionable typed errors.

## Initial schema

### projects

One workspace/project.

- id
- name
- created_at

### datasets

A versioned analytical dataset belonging to a project.

- id
- project_id
- name
- version
- created_at

### studies

A reproducible research question belonging to a project.

- id
- project_id
- name
- question
- created_at

Future schema versions will add people, variables, observations, events, achievements, models, scenarios, trajectories and report metadata.

## Migration contract

Every schema change must:

1. have a monotonically increasing version;
2. be idempotent where practical;
3. execute inside a controlled migration process;
4. be covered by migration tests;
5. preserve previously committed dataset versions.

The application must never silently recreate or discard an existing database.

## Security and privacy

The database is local-first. No network transmission is implied by opening, importing, analyzing or reporting data.

Cloud/AI integrations must be explicit user actions and must have a separate data-sharing policy.
