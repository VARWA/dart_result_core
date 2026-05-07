import 'app_failure.dart';

/// Network communication failure.
final class NetworkFailure extends AppFailure {
  const NetworkFailure({super.message, super.stackTrace});
}

/// Authentication token issue.
final class TokenFailure extends AppFailure {
  const TokenFailure({super.message, super.stackTrace});
}

/// Backend/server returned an invalid or failed response.
final class ServerFailure extends AppFailure {
  const ServerFailure({super.message, super.stackTrace});
}

/// Catch-all failure for unclassified errors.
final class UnknownFailure extends AppFailure {
  const UnknownFailure({super.message, super.stackTrace});
}

/// Operation was cancelled intentionally.
final class CancelledFailure extends AppFailure {
  const CancelledFailure({super.message = 'Operation cancelled'});
}

/// Parsing or data conversion failure.
final class ParsingFailure extends AppFailure {
  const ParsingFailure({super.message, super.stackTrace});
}
