# Dataset Lab Specification

## Purpose

Dataset Lab is the controlled entry point for all analytical data.

The application distinguishes raw imported data, validated data, explicit preprocessing, committed dataset versions, and analytical results derived from a specific dataset version.

## Variable dictionary

Every variable has a stable identifier, name, description, semantic type, optional unit and missing-data policy.

Foundation types:

- continuous
- discrete
- categorical
- ordinal
- binary
- date/time
- duration
- text

## Observations

An observation connects a person, variable, value, optional timestamp and optional source.

Missing values are explicit and are never silently converted to zero.

## Versioning

A committed dataset version is immutable.

Changing source data or preprocessing creates a new dataset version.

Every analysis retains the dataset identifier and version, variable identifiers, preprocessing identifier, algorithm version, parameters and random seed when applicable.

## Import pipeline

File → Detect format → Parse → Infer schema → Validate → Review → Commit version.

The user must inspect inferred types before committing an imported dataset.

## Data quality

Dataset Lab will report row count, variable count, missingness, invalid values, duplicate identifiers, type conflicts, unit conflicts and suspicious ranges.

Warnings never automatically delete or transform data.

## Privacy

Imported personal data remains local by default. External AI/cloud processing requires explicit user action and a visible data-sharing boundary.
