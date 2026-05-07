# Changelog

All notable changes to this project will be documented in this file.

## 1.0.0

- First stable release of `dart_result_core`, focused on explicit and composable error handling in Dart applications.

- Core result model:
  - Added sealed `Result<T>` with `Success<T>` and `Failure<T>` branches.
  - Added state helpers: `isSuccess`, `isFailure`.
  - Added extraction helpers: `getOrThrow`, `getOrElse`.
  - Added reducer API: `fold`.

- Composition and recovery:
  - Added functional composition operators: `map`, `flatMap`, `mapFailure`.
  - Added recovery operators: `recover`, `recoverWith`.
  - Added matching helper: `match`.
  - Added nullable/fallback helpers: `orNull`, `or`.

- Async support:
  - Added `Result.trySync` for safe exception-to-failure mapping in synchronous operations.
  - Added `Result.tryAsync` for safe exception-to-failure mapping.
  - Added async composition: `mapAsync`, `flatMapAsync`.
  - Added side-effect helpers for observability/debugging: `tap`, `tapFailure`.

- Failure model:
  - Added base `AppFailure` contract with optional `message` and `stackTrace`.
  - Added built-in failure types: `NetworkFailure`, `TokenFailure`, `ServerFailure`, `UnknownFailure`, `CancelledFailure`, `ParsingFailure`.
  - Added value equality semantics for failures to improve deterministic behavior in tests and business logic.
  - Added default message for `CancelledFailure` and stricter final failure type declarations.

- Quality and tooling:
  - Added strict linting via `analysis_options.yaml`.
  - Added CI workflow for format, analyze, test, and `dart pub publish --dry-run`.
  - Expanded unit test coverage for success/failure paths, recovery, sync/async mapping, and side-effect hooks.

- Documentation and DX:
  - Added comprehensive README with quick start, async, and recovery examples.
  - Added release quality-gates checklist and improved install guidance.
  - Added `CONTRIBUTING.md` with contributor workflow and PR checklist.
  - Aligned package naming and primary library entrypoint with pub.dev conventions (`dart_result_core` / `lib/dart_result_core.dart`).
  - Improved debug readability with `toString()` for `Success<T>` and `Failure<T>`.
