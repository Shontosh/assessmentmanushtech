import 'package:equatable/equatable.dart';

// Base class for all failure types
abstract class Failure extends Equatable {
  final String error;
  final String message;

  const Failure({required this.error, required this.message});

  @override
  List<Object> get props => [error];
}

// Server failure
class ServerFailure extends Failure {
  const ServerFailure({required super.error, required super.message});
}

// API failure
class ApiFailure extends Failure {
  const ApiFailure({required super.error, required super.message});
}

// Cache failure
class CacheFailure extends Failure {
  const CacheFailure({required super.error, required super.message});
}

// Internal failure
class InternalFailure extends Failure {
  const InternalFailure({required super.error, required super.message});
}
