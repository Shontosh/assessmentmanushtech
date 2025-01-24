import 'package:equatable/equatable.dart';

// Base class for all exceptions
abstract class BaseException extends Equatable implements Exception {
  // The error message associated with the exception
  final String error;

  const BaseException({required this.error});

  // For equality comparison
  @override
  List<Object> get props => [error];

  @override
  String toString() => '$runtimeType: $error';
}

// Server-specific exception
class ServerException extends BaseException {
  const ServerException({required super.error});
}

// API-specific exception
class ApiException extends BaseException {
  const ApiException({required super.error});
}

// Cache-specific exception
class CacheException extends BaseException {
  const CacheException({required super.error});
}

// Format-specific exception
class FormatException extends BaseException {
  const FormatException({required super.error});
}

// Internal application exception
class InternalException extends BaseException {
  const InternalException({required super.error});
}

// Internal application exception
class UnexpectedException extends BaseException {
  const UnexpectedException({required super.error});
}
