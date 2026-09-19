# Domain Specification

## 1. Research model

MIR Success Lab treats a person not as a single success score, but as a multidimensional temporal trajectory.

Core structure:

Person -> Attributes + Observations + Events + Habits + Achievements + Trajectory

Every analysis result must be tied to a defined period, population, and variable set.

## 2. Person

Stable research subject identity.

Required: id, category, anonymization status.

Optional: display name, birth year/range, geography, occupation, metadata.

Sensitive datasets should support pseudonyms.

## 3. Variable

Defines the meaning of a measurement.

Fields: id, name, description, type, unit, domain, allowed range, missing-data policy.

Types: continuous, discrete, categorical, ordinal, binary, date/time, duration, text metadata.

## 4. Observation

Connects Person, Variable, Timestamp, Value and Provenance.

The same variable may have many observations over time.

## 5. Event

Records an important state change or fact. Every event has a timestamp or interval.

Examples: education, company launch, career transition, competition, investment, team change.

## 6. Habit

Describes a recurring behavior. Distinguish reported, observed and estimated habits. Source and confidence are required where this distinction affects analysis.

## 7. Achievement

A measurable outcome containing metric, value, unit, timestamp and source.

The system must not assume a universal success scale.

## 8. Outcome

Each Study explicitly defines its outcome, for example annual income, company survival, competition rank, performance metric or completed goal.

## 9. Population

Defines who is being compared. Every comparison must expose its population definition.

## 10. Trajectory

A temporal sequence combining observations, events and achievements while preserving temporal ordering.

## 11. Study

Main research container. Minimum: Question, Hypothesis, Population, Dataset, Features, Outcome, Time Window, Methods, Results, Limitations.

## 12. Scenario

A Scenario is not a historical observation. It stores baseline, changed assumptions, model, horizon, simulation settings and output distribution.

Scenarios must be visually separated from historical data.

## 13. Composite scores

The system must not reduce a complex human trajectory to a universal success index without an explicit methodology.

If a user creates a composite score, the application must expose variables, weights, normalization, period, population and limitations.
