# Statistics Specification

## 1. Goal

The statistical layer must answer not only what number was produced, but on which data, by which method, with what uncertainty, under which assumptions, and how robust the result is.

## 2. Descriptive statistics

Minimum: count, missing count, mean, median, variance, standard deviation, minimum, maximum, quantiles and interquartile range. Store sample size and missingness.

## 3. Distributions

Support histogram, empirical CDF, quantile summary and outlier diagnostics.

Outliers must not be silently removed. Removal or winsorization is an explicit preprocessing step.

## 4. Correlation

Minimum methods: Pearson and Spearman.

Store coefficient, sample size, missing-data handling, confidence interval when supported, p-value when used, and warnings for unsuitable data structures.

The interface must not describe correlation as causation.

## 5. Group comparison

Expose Group A, Group B, N_A, N_B, difference, effect size, uncertainty and method. Do not reduce interpretation to p-value.

## 6. Regression

Store dependent variable, predictors, coefficients, standard errors, confidence intervals, sample size, fit metrics, diagnostics, preprocessing and model version.

Categorical encoding must be reproducible.

## 7. Time series

Account for ordering, sampling interval, gaps, seasonality where applicable, trend and autocorrelation. Do not shuffle temporal observations before temporal validation.

## 8. Validation

Support train/test split, k-fold cross-validation, blocked time-series validation and leave-one-group-out where appropriate. Store the validation method with the result.

## 9. Effect size

Where applicable, show effect size in addition to statistical significance so practical magnitude can be distinguished from detectability.

## 10. Multiple testing

For multiple statistical tests store the number of tests and correction method when applied.

## 11. Missing data

Missing values never become zero automatically. Supported strategies may include complete case, pairwise, imputation, model-based handling and not-applicable exclusion. Store the selected strategy in analysis metadata.

## 12. Sensitivity analysis

Important studies should support reruns under changed inclusion criteria, preprocessing, outlier policy and model parameters. Link sensitivity results to the source Study.

## 13. Numerical correctness

C++ tests must cover empty input, one observation, constant variables, missing values, extreme values, large samples, invalid units and deterministic random seeds.

## 14. Result presentation

Every statistical visualization must expose or provide access to N, method, uncertainty, data period and variable definition.
