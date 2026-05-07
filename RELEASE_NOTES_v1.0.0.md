# v1.0.0

First stable release of `dart_result_core`.

## Highlights

- Stable typed result model: `Result<T>`, `Success<T>`, `Failure<T>`.
- Functional composition: `map`, `flatMap`, `fold`, `mapFailure`.
- Recovery operators: `recover`, `recoverWith`, `getOrElse`, `getOrThrow`.
- Safe execution: `Result.trySync`, `Result.tryAsync`.
- Async support: `mapAsync`, `flatMapAsync`.
- Side-effect and matching helpers: `tap`, `tapFailure`, `match`, `or`, `orNull`.

## Failure Model

- Base failure contract: `AppFailure`.
- Built-in failure types:
  - `NetworkFailure`
  - `TokenFailure`
  - `ServerFailure`
  - `UnknownFailure`
  - `CancelledFailure`
  - `ParsingFailure`
- Value equality for deterministic behavior in tests and domain logic.
- Default message for `CancelledFailure`.
- Clear `toString()` for `Success<T>` and `Failure<T>` for better debugging.

## Quality and Tooling

- Strict linting (`analysis_options.yaml`).
- CI checks: format, analyze, test, and `dart pub publish --dry-run`.
- Expanded unit tests for sync/async paths, recovery, and side effects.
