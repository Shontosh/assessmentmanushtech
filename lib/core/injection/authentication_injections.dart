
import 'package:assesmentmanushtech/core/injection/injection_container.dart';
import 'package:assesmentmanushtech/features/authentication/bloc/sign_in_cubit.dart';
import 'package:assesmentmanushtech/features/authentication/data/data_providers/auth_remote_data_provider.dart';
import 'package:assesmentmanushtech/features/authentication/data/repositories/auth_repository.dart';

initAuth() async {
  //* data providers
  getIt.registerLazySingleton<AuthRemoteDataProvider>(
          () => AuthRemoteDataProviderImpl(
        client: getIt(),
      ));

  //* Repositories
  getIt.registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(remoteDataProvider: getIt(), authService: getIt()));

  //* Blocs
  getIt
    ..registerFactory(() => SignInCubit(repository: getIt()));
}
