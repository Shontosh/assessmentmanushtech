import 'package:assesmentmanushtech/core/blocs/boolean_cubit.dart';
import 'package:assesmentmanushtech/core/injection/injection_container.dart';
import 'package:assesmentmanushtech/core/language/language_service.dart';
import 'package:assesmentmanushtech/core/network/api_client.dart';
import 'package:assesmentmanushtech/core/services/auth_service.dart';
import 'package:assesmentmanushtech/core/services/cart_service.dart';
import 'package:assesmentmanushtech/core/storage/cart_ietm_adapter.dart';
import 'package:assesmentmanushtech/core/storage/cart_storage_adapter.dart';
import 'package:assesmentmanushtech/core/storage/hive_storage_adapter.dart';
import 'package:assesmentmanushtech/core/storage/secure_storage_adapter.dart';
import 'package:assesmentmanushtech/core/storage/storage_adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:assesmentmanushtech/features/home/data/models/cart_item.dart';  // Import CartItemAdapter

void initCore() async {

  getIt.registerLazySingleton(() => CartItemAdapter());

  // Register CartItemAdapter with Hive

  //* Blocs
  getIt.registerFactory(() => BooleanCubit());

  //* Networking
  getIt.registerFactory<Dio>(() => Dio());
  getIt.registerLazySingleton(() => FlutterSecureStorage());
  getIt.registerLazySingleton<StorageAdapter>(
          () => SecureStorageAdapter(getIt()),
      instanceName: 'secure');
  getIt.registerFactory<ApiClient>(
          () => ApiClient(authService: getIt()));

  // Open the Hive box for storage
  var hiveBox = await Hive.openBox('appBox');
  getIt.registerLazySingleton<StorageAdapter>(() => HiveStorageAdapter(hiveBox),
      instanceName: 'normal');
  getIt.registerLazySingleton(() => CartService(getIt(instanceName: 'normal')));

  // Language storage box
  final langBox = await Hive.openBox('langBox');
  getIt.registerLazySingleton<Box>(() => langBox, instanceName: 'langBox');

  //* Data Sources
  getIt.registerLazySingleton<LanguageService>(() => LanguageService());

  getIt.registerLazySingleton(() => AuthService(getIt(instanceName: 'secure')));

  //* Database (you can also open other boxes here if needed)
}
