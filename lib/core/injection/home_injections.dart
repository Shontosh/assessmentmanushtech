import 'package:assesmentmanushtech/core/injection/injection_container.dart';
import 'package:assesmentmanushtech/features/home/bloc/get_products_cubit.dart';
import 'package:assesmentmanushtech/features/home/bloc/quantity_cubit.dart';
import 'package:assesmentmanushtech/features/home/data/data_providers/get_products_remote_data_provider.dart';
import 'package:assesmentmanushtech/features/home/data/repositories/products_repository.dart';

initHome() async {
  //* data providers
  getIt.registerLazySingleton<GetProductsRemoteDataProvider>(
          () => GetProductsRemoteDataProviderImpl(
        client: getIt(),
      ));

  //* Repositories
  getIt.registerLazySingleton<GetProductsRepository>(() =>
      GetProductsRepositoryImpl(remoteDataProvider: getIt()));

  //* Blocs
  getIt
    ..registerFactory(() => GetProductsCubit(repository: getIt()))
  ..registerFactory(() => QuantityCubit());



}
