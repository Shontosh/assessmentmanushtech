import 'dart:async';
import 'package:assesmentmanushtech/core/constants/api_urls.dart';
import 'package:assesmentmanushtech/core/error/exceptions.dart';
import 'package:assesmentmanushtech/core/network/api_client.dart';
import 'package:assesmentmanushtech/core/network/return_response.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/params/sign_in_params.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/sign_in_response.dart';
import 'package:assesmentmanushtech/features/home/data/models/products_data_response.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


abstract class GetProductsRemoteDataProvider {
  Future<ProductsDataResponse> getProducts();
}

class GetProductsRemoteDataProviderImpl extends GetProductsRemoteDataProvider {
  final ApiClient client;
  GetProductsRemoteDataProviderImpl({
    required this.client,
  });

  @override
  Future<ProductsDataResponse> getProducts() async {
    Response response;
    try {
      response =
      await client.dio.get(ApiUrls.products);
    } on DioException catch (e) {
      if (e.response == null) {
        throw ServerException(error: e.toString());
      }
      response = e.response!;
    }
    return ReturnResponse<ProductsDataResponse>()(
        response, (json) => ProductsDataResponse.fromJson(json));
  }

}
