# UI Specification

## 1. Concept

MIR Success Lab is a professional macOS research environment rather than a collection of decorative dashboard cards.

Core flow:

Question -> Data -> Analysis -> Evidence -> Scenario -> Report

## 2. Navigation

Recommended sections:

1. Dashboard
2. People
3. Datasets
4. Studies
5. Analysis
6. Trajectories
7. Scenarios
8. Reports

## 3. Dashboard

Show active studies, datasets, recent analyses, data-quality warnings and reproducibility status.

Do not show fabricated KPIs before real data exists.

## 4. People

Provide search, filters, category, tags, anonymized display and timeline preview. The profile is an analytical record, not a social profile.

## 5. Dataset Lab

Support import, schema inspection, variable definitions, missing-data inspection, validation, provenance and version history.

Data quality must be visible before analysis.

## 6. Study Workspace

Question -> Population -> Variables -> Outcome -> Method -> Run -> Results.

A Study must be saved and reproducible.

## 7. Analysis Workspace

Left: analysis tree, variables, filters.

Center: chart, table and model output.

Right: assumptions, methodology, uncertainty and warnings.

## 8. Trajectory Lab

Show historical observations, events, achievements, group trajectories, uncertainty and selected time window.

5/10/15-year scenarios must be visually distinct from historical observations.

## 9. Scenario Lab

User defines baseline, changed variables, assumptions and horizon. Show Baseline versus Scenario with a result range rather than a guaranteed single value.

## 10. Charts

Minimum: line, scatter, histogram, box plot, heatmap, correlation matrix, timeline and trajectory band.

Each chart should expose title, units, period, N and legend, with method/context where relevant.

## 11. Research Report

Report preview contains research question, dataset, population, methods, results, visualizations, uncertainty, limitations and reproducibility metadata.

## 12. Empty states

Every empty screen explains the next action. Example: No Dataset. Import CSV/JSON or create a Dataset manually.

## 13. Interaction

Keyboard-first. Provide fast search, Cmd+O for opening a Dataset, Cmd+S for saving, Cmd+Z/Cmd+Shift+Z where undo/redo applies. Long operations must not block the UI and must expose progress and cancellation.

## 14. Visual direction

Dark professional interface, restrained glass, high readability, minimal decoration, data-first hierarchy and consistent typography. Visual effects must serve usability.

## 15. Accessibility

Support keyboard navigation, VoiceOver labels, sufficient contrast and do not use color as the only information channel.
