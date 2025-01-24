import 'package:assesmentmanushtech/core/error/failures.dart';
import 'package:assesmentmanushtech/core/network/return_failure.dart';
import 'package:assesmentmanushtech/core/services/auth_service.dart';
import 'package:assesmentmanushtech/features/authentication/data/data_providers/auth_remote_data_provider.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/params/sign_in_params.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/sign_in_response.dart';
import 'package:assesmentmanushtech/features/home/data/data_providers/get_products_remote_data_provider.dart';
import 'package:assesmentmanushtech/features/home/data/models/products_data_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

abstract class GetProductsRepository {
  Future<Either<Failure, ProductsDataResponse>> getProducts();
}

class GetProductsRepositoryImpl extends GetProductsRepository {
  final GetProductsRemoteDataProvider remoteDataProvider;

  GetProductsRepositoryImpl({
    required this.remoteDataProvider
  });

  @override
  Future<Either<Failure, ProductsDataResponse>> getProducts() async {
    try {
      final response = await remoteDataProvider.getProducts();
      debugPrint("ProductsDataResponse ${response}");

      return Right(response);
    } catch (e) {
      debugPrint("Error get products in $e");
      return ReturnFailure<ProductsDataResponse>()(e as Exception);
    }
  }

}


