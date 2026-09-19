# Analytics API Contract

## 1. Назначение

Этот документ фиксирует контракт между Swift application layer и C++26 Analytics Engine.

Главное правило: UI не зависит от внутренней реализации математического ядра.

## 2. Request/Response

Каждая операция имеет форму:

```
Request
→ validation
→ engine execution
→ Result
```

Результат должен содержать:

- operation ID;
- status;
- engine version;
- warnings;
- errors;
- payload;
- reproducibility metadata.

## 3. Operation envelope

Концептуально:

```
AnalysisRequest {
    operation
    datasetID
    studyID
    variables
    parameters
    options
}
```

```
AnalysisResult {
    operationID
    status
    engineVersion
    warnings
    payload
    reproducibility
}
```

## 4. Reproducibility metadata

Каждый вычислительный результат должен иметь:

- dataset version;
- algorithm name;
- algorithm version;
- preprocessing version;
- parameter set;
- random seed, если применимо;
- execution timestamp;
- input variable IDs.

## 5. Первые операции

Foundation:

```
engineInfo()
validateDataset()
describeDataset()
```

Следующий этап:

```
calculateDescriptiveStatistics()
compareGroups()
calculateCorrelation()
```

Далее:

```
fitRegression()
clusterProfiles()
findSimilarProfiles()
simulateScenario()
buildTrajectory()
```

## 6. Cancellation

Долгие операции получают cancellation token.

Cancellation не должен приводить к повреждению Dataset или Study.

Статус результата:

```
completed
failed
cancelled
```

## 7. Progress

Progress должен быть нормализован:

```
0.0 ... 1.0
```

Дополнительно может передаваться текстовое состояние:

- validating;
- loading;
- computing;
- postprocessing;
- saving.

## 8. Determinism

При одинаковых:

- Dataset version;
- parameters;
- preprocessing;
- algorithm version;
- random seed;

результат должен быть воспроизводим в пределах заявленной численной погрешности.

## 9. Versioning

Изменение математического алгоритма, способное изменить результат, требует изменения algorithm version.

Нельзя silently менять алгоритм под тем же идентификатором.

## 10. Security / privacy

Boundary не должен автоматически отправлять данные в сеть.

Любая будущая AI/cloud интеграция должна быть отдельным явно включаемым слоем.

## 11. UI contract

SwiftUI получает только подготовленные данные представления:

- chart series;
- table rows;
- statistics cards;
- timeline items;
- report sections.

SwiftUI не вычисляет статистику самостоятельно.

## 12. Future compatibility

API должен позволять добавлять новые аналитические операции без изменения существующих операций.

Новые поля в сериализуемых структурах должны быть backward-compatible либо сопровождаться версией схемы.
