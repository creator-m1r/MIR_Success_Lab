# Repository Rules

## 1. Architecture

Keep UI, application services, domain models, persistence, bridge and C++ engine separate.

A View must not contain SQL or statistical algorithms.

## 2. C++ boundary

Only the bridge knows the C ABI. Internal C++ modules use normal C++26 interfaces.

Do not leak STL containers, exceptions, references or ownership-sensitive C++ objects through the ABI.

## 3. Data integrity

Raw imported data is immutable once committed to a Dataset version.

Transformations create explicit preprocessing versions.

Never silently overwrite source data.

## 4. Reproducibility

Every analysis result records Dataset version, algorithm version, parameters, preprocessing and random seed where relevant.

## 5. Privacy

Local-first by default.

No network request is allowed merely because a user imports or analyzes data.

Cloud/AI features must be explicit opt-in integrations.

## 6. Errors

Errors must be typed and actionable.

Never swallow an engine, persistence or validation error just to keep the UI running.

## 7. Concurrency

Heavy work must not run on the main UI thread.

Cancellation must be cooperative and safe.

## 8. Testing

New domain behavior requires tests.

New statistical algorithms require deterministic reference cases and edge-case tests.

Database migrations require migration tests.

## 9. Documentation

Public architecture decisions and non-obvious mathematical assumptions belong in docs/.

Update documentation when an API or data contract changes.

## 10. Source layout

Keep directories focused. Avoid creating a deep hierarchy for one or two files.

Prefer cohesive modules over large miscellaneous utility folders.

## 11. UI

Do not invent analytical numbers for visual polish.

Loading, empty, error and unavailable states must be explicit.

Historical data and modeled scenarios must never be visually conflated.

## 12. Research integrity

The application must distinguish:

- observation;
- association;
- prediction;
- scenario;
- causal claim.

A model output must never be presented as proof of causation without an appropriate research design.
