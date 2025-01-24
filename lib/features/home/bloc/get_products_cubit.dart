import 'package:assesmentmanushtech/core/blocs/common_api_state.dart';
import 'package:assesmentmanushtech/core/error/failures.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/params/sign_in_params.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/sign_in_response.dart';
import 'package:assesmentmanushtech/features/authentication/data/repositories/auth_repository.dart';
import 'package:assesmentmanushtech/features/home/data/models/products_data_response.dart';
import 'package:assesmentmanushtech/features/home/data/repositories/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductsCubit extends Cubit<CommonApiState> {
  GetProductsCubit({required GetProductsRepository repository})
      : _repository = repository,
        super(ApiInitial());
  final GetProductsRepository _repository;
  Future<void> getProducts() async {
    emit(ApiLoading());
    final failureOrResponse = await _repository.getProducts();

    failureOrResponse.fold((failure) {
      if (failure is ServerFailure) {
        emit(ApiError(message: ''));
      } else {
        emit(ApiError(message: 'Unknown Exception'));
      }
    }, (response) {
      emit(ApiSuccess<ProductsDataResponse>(response: response));
    });
  }
}
