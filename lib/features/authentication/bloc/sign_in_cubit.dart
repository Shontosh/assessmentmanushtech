import 'package:assesmentmanushtech/core/blocs/common_api_state.dart';
import 'package:assesmentmanushtech/core/error/failures.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/params/sign_in_params.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/sign_in_response.dart';
import 'package:assesmentmanushtech/features/authentication/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<CommonApiState> {
  SignInCubit({required AuthRepository repository})
      : _repository = repository,
        super(ApiInitial());
  final AuthRepository _repository;
  Future<void> signin(SignInParams signinParams) async {
    emit(ApiLoading());
    final failureOrResponse = await _repository.signin(signinParams);

    failureOrResponse.fold((failure) {
      if (failure is ServerFailure) {
        emit(ApiError(message: ''));
      } else {
        emit(ApiError(message: 'Unknown Exception'));
      }
    }, (response) {
      emit(ApiSuccess<SignInResponse>(response: response));
    });
  }
}
