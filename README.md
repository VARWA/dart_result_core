# dart_result_core

[![pub package](https://img.shields.io/pub/v/dart_result_core.svg)](https://pub.dev/packages/dart_result_core)
![Dart](https://img.shields.io/badge/dart-%3E%3D3.7.2-blue)
![License: MIT](https://img.shields.io/badge/license-MIT-green)

Typed `Result<T>` and `AppFailure` primitives for predictable, composable error handling in Dart.

## Why this package

- Makes success and failure states explicit in types.
- Removes exception-driven control flow from domain logic.
- Keeps sync and async composition symmetrical and testable.

## Installation

```yaml
dependencies:
  dart_result_core: ^1.0.0
```

## Core API

- Constructors: `Result.success(value)`, `Result.failure(error)`
- Safe execution: `Result.trySync`, `Result.tryAsync`
- Composition: `map`, `flatMap`, `fold`, `mapFailure`
- Recovery: `recover`, `recoverWith`, `getOrElse`, `getOrThrow`
- Async: `Result.tryAsync`, `mapAsync`, `flatMapAsync`
- Ergonomics: `match`, `or`, `orNull`, `tap`, `tapFailure`

## Quick start

```dart
import 'package:dart_result_core/dart_result_core.dart';

Result<int> parsePositiveInt(String input) {
  final value = int.tryParse(input);
  if (value == null) {
    return Result.failure(ParsingFailure(message: 'Invalid number: $input'));
  }
  if (value < 0) {
    return Result.failure(ParsingFailure(message: 'Negative value: $value'));
  }
  return Result.success(value);
}

void main() {
  final message = parsePositiveInt('42')
      .map((x) => x * 2)
      .fold(
        (value) => 'Success: $value',
        (error) => 'Failure: $error',
      );

  // ignore: avoid_print
  print(message);
}
```

## Async and recovery

```dart
import 'package:dart_result_core/dart_result_core.dart';

Future<Result<int>> loadPort(String rawPort) async {
  return Result.tryAsync(
    () async => int.parse(rawPort),
    onError: (error, stackTrace) =>
        ParsingFailure(message: error.toString(), stackTrace: stackTrace),
  );
}

Future<void> main() async {
  final port = (await loadPort('invalid'))
      .recover((_) => 8080)
      .getOrThrow();

  assert(port == 8080);
}
```

## Failures

Built-in failure types:
- `NetworkFailure`
- `TokenFailure`
- `ServerFailure`
- `UnknownFailure`
- `CancelledFailure`
- `ParsingFailure`

All failure types derive from `AppFailure`.

## Quality gates

Recommended pre-release checks:

```bash
dart format --output=none --set-exit-if-changed .
dart analyze
dart test
dart pub publish --dry-run
```

## Contributing

See `CONTRIBUTING.md` for local setup and PR checklist.

## License

MIT. See `LICENSE`.
