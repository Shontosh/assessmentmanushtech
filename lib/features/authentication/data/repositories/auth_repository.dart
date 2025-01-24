import 'package:assesmentmanushtech/core/error/failures.dart';
import 'package:assesmentmanushtech/core/network/return_failure.dart';
import 'package:assesmentmanushtech/core/services/auth_service.dart';
import 'package:assesmentmanushtech/features/authentication/data/data_providers/auth_remote_data_provider.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/params/sign_in_params.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/sign_in_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInResponse>> signin(SignInParams signinParams);
}

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataProvider remoteDataProvider;
  final AuthService authService;

  AuthRepositoryImpl({
    required this.remoteDataProvider,
    required this.authService,
  });

  @override
  Future<Either<Failure, SignInResponse>> signin(
      SignInParams signinParams) async {
    try {
      final response = await remoteDataProvider.signin(signinParams);
      debugPrint("signin ${response.token}");
      if (response.token != null) {
        authService.saveAccessToken(response.token??"");
      }
      return Right(response);
    } catch (e) {
      debugPrint("Error signing in $e");
      return ReturnFailure<SignInResponse>()(e as Exception);
    }
  }

}


