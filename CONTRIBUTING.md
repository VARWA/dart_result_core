# Contributing

Thanks for your interest in improving `dart_result_core`.

## Development setup

```bash
dart pub get
dart format .
dart analyze
dart test
```

## Pull request checklist

- Keep API changes backward-compatible where possible.
- Add or update tests for all behavior changes.
- Keep public API docs and examples in sync.
- Update `CHANGELOG.md` when user-facing behavior changes.
- Ensure CI is green (`format`, `analyze`, `test`, `pub publish --dry-run`).
