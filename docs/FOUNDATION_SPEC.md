# Foundation Specification

## 1. Назначение

Этот документ фиксирует первый исполняемый технический этап MIR Success Lab: создание минимального macOS-приложения с чистым разделением SwiftUI, C++26 Analytics Engine и SQLite.

Цель этапа — получить компилируемый, тестируемый фундамент, на который последовательно добавляются Data Lab и статистические модули.

## 2. Требования

### 2.1 macOS application

- Swift 6+ / SwiftUI.
- Один основной application target.
- Минимальная версия macOS должна быть определена в Xcode project settings и зафиксирована в документации.
- UI не содержит статистических алгоритмов.

### 2.2 C++26 engine

Рекомендуемая структура:

```
Engine/
├── Core/
├── Data/
├── Statistics/
├── Regression/
├── TimeSeries/
├── Clustering/
├── Similarity/
├── Scenario/
├── Validation/
├── Reporting/
└── Tests/
```

На первом этапе реализовать только инфраструктурные типы и health-check API. Статистические алгоритмы добавляются следующими этапами.

### 2.3 Swift/C++ boundary

Boundary должен быть минимальным и стабильным.

Swift не должен напрямую обращаться к внутренним классам C++.

Рекомендуемый слой:

```
SwiftUI
  ↓
Swift Application Services
  ↓
MIRAnalyticsBridge
  ↓
MIR Analytics C API / opaque handles
  ↓
C++26 Engine
```

Для ABI-границы предпочтителен C-compatible слой с opaque handles и сериализуемыми DTO. Внутренний C++ API остаётся современным C++26.

### 2.4 Persistence

SQLite используется как локальное хранилище.

Требования:

- WAL mode;
- foreign keys enabled;
- migration versioning;
- transaction boundaries;
- prepared statements;
- отсутствие SQL-логики в SwiftUI Views;
- резервное копирование базы на уровне application service.

## 3. Первые доменные типы

Создать базовые идентификаторы:

- PersonID
- DatasetID
- StudyID
- VariableID
- ObservationID
- ModelID
- ScenarioID
- TrajectoryID
- ReportID

Идентификаторы не должны зависеть от UI.

## 4. Application services

Минимальный набор:

- ProjectService
- DatasetService
- StudyService
- AnalyticsService
- ReportService

На Foundation этапе Dataset/Study/Analytics могут иметь только минимальные заглушки, но их контракты должны быть определены заранее.

## 5. Ошибки

Единый слой ошибок должен различать:

- invalid input;
- validation failure;
- database error;
- engine error;
- unsupported operation;
- cancelled;
- internal error.

Ошибки C++ не должны пересекать Swift boundary в виде C++ exceptions.

## 6. Асинхронность

Все потенциально тяжёлые операции выполняются вне MainActor.

AnalyticsService должен поддерживать:

- start;
- progress;
- cancellation;
- completion;
- failure.

## 7. Тестирование

Минимум:

### Swift

- service tests;
- persistence tests;
- DTO/serialization tests.

### C++

- core type tests;
- boundary tests;
- deterministic execution tests;
- error handling tests.

### Integration

Тест:

```
create project
→ create dataset
→ pass dataset through bridge
→ execute engine health check
→ persist result
→ reopen database
→ verify result
```

## 8. Definition of Done

Foundation считается завершённым, если:

1. Xcode project собирается без предупреждений, связанных с новым кодом.
2. SwiftUI application запускается.
3. SQLite database создаётся автоматически.
4. Database migrations выполняются.
5. C++26 engine собирается отдельно.
6. Swift успешно вызывает C++ health-check.
7. Ошибка C++ корректно преобразуется в Swift Error.
8. Есть unit tests для Swift и C++.
9. Есть integration test полного минимального pipeline.
10. Документация API и структура каталогов совпадают с фактическим кодом.

## 9. Ограничения

На Foundation этапе не реализовывать:

- AI;
- Monte Carlo;
- сложную регрессию;
- автоматическое прогнозирование судьбы человека;
- облачную синхронизацию;
- сетевую передачу персональных данных.

Сначала строится воспроизводимый локальный исследовательский фундамент.
