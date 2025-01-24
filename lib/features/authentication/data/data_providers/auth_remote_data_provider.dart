import 'dart:async';
import 'package:assesmentmanushtech/core/constants/api_urls.dart';
import 'package:assesmentmanushtech/core/error/exceptions.dart';
import 'package:assesmentmanushtech/core/network/api_client.dart';
import 'package:assesmentmanushtech/core/network/return_response.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/params/sign_in_params.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/sign_in_response.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


abstract class AuthRemoteDataProvider {
  Future<SignInResponse> signin(SignInParams signinParams);
}

class AuthRemoteDataProviderImpl extends AuthRemoteDataProvider {
  final ApiClient client;
  AuthRemoteDataProviderImpl({
    required this.client,
  });

  @override
  Future<SignInResponse> signin(SignInParams signinParams) async {
    Response response;
    try {
      response =
      await client.dio.post(ApiUrls.signin, data: signinParams.toJson());
    } on DioException catch (e) {
      if (e.response == null) {
        throw ServerException(error: e.toString());
      }
      response = e.response!;
    }
    return ReturnResponse<SignInResponse>()(
        response, (json) => SignInResponse.fromJson(json));
  }

}
