import 'package:assesmentmanushtech/core/constants/error_messages.dart';
import 'package:dartz/dartz.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';

class ReturnFailure<T> {
  Future<Either<Failure, T>> call(Exception e) async {
    if (e is ServerException) {
      return Left(
          ServerFailure(error: e.error, message: ErrorMessage.serverFailure));
    } else if (e is ApiException) {
      return Left(ApiFailure(error: e.error, message: ErrorMessage.apiFailure));
    } else if (e is CacheException) {
      return Left(
          CacheFailure(error: e.error, message: ErrorMessage.cacheFailure));
    } else {
      return Left(InternalFailure(
          error: ErrorMessage.internalFailure,
          message: ErrorMessage.internalFailure));
    }
  }
}
