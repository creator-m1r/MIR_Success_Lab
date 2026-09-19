# Architecture

## 1. Общая схема

```
┌──────────────────────────────────────┐
│             SwiftUI App              │
├──────────────────────────────────────┤
│ Presentation / Navigation / Charts   │
├──────────────────────────────────────┤
│        Swift Application Layer       │
├──────────────────────────────────────┤
│       C++26 Analytics Interface      │
├──────────────────────────────────────┤
│          MIR Analytics Engine        │
│ Statistics • Models • Scenarios      │
├──────────────────────────────────────┤
│          Data / Persistence          │
│              SQLite                  │
└──────────────────────────────────────┘
```

## 2. Swift layer

Отвечает за:

- окна и navigation;
- состояние приложения;
- формы исследования;
- таблицы;
- графики;
- timeline;
- scenario editor;
- report preview;
- импорт/экспорт;
- настройки.

SwiftUI не выполняет тяжёлые статистические расчёты.

## 3. C++26 engine

Предлагаемая структура:

```
MIRAnalytics/
├── Core/
├── Data/
├── Statistics/
├── Regression/
├── TimeSeries/
├── Clustering/
├── Similarity/
├── Scenario/
├── MonteCarlo/
├── Validation/
└── Reporting/
```

Каждый модуль должен иметь узкий публичный API и тесты.

## 4. Boundary

Между Swift и C++ должен существовать стабильный слой Analytics API.

Пример концептуального API:

```text
loadDataset()
describeDataset()
compareGroups()
calculateCorrelation()
fitRegression()
clusterProfiles()
findSimilarProfiles()
simulateScenario()
buildTrajectory()
generateReportData()
```

Формат результата должен быть типизированным и пригодным для сериализации.

## 5. Data flow

```
Import
  ↓
Validation
  ↓
Normalization
  ↓
Dataset
  ↓
Study
  ↓
Analysis
  ↓
Validation
  ↓
Result
  ↓
Visualization
  ↓
Report
```

## 6. Reproducibility

Каждый ModelResult должен ссылаться на:

- dataset version;
- study ID;
- algorithm;
- algorithm version;
- parameters;
- timestamp;
- input variable definitions.

## 7. Performance

Тяжёлые операции выполняются вне main thread.

C++ engine должен поддерживать:

- cancellation;
- progress reporting;
- deterministic mode;
- reproducible random seeds;
- parallel computation там, где это безопасно.

## 8. Extensibility

Новые методы анализа должны добавляться без переписывания UI.

UI работает с абстракциями:

```
AnalysisRequest
AnalysisResult
VisualizationData
ReportSection
```

а не с конкретной реализацией алгоритма.
