import 'dart:async';
import 'dart:io';

import 'package:assesmentmanushtech/app/build_config.dart';
import 'package:assesmentmanushtech/config/firebase_options.dart';
import 'package:assesmentmanushtech/core/language/app_language.dart';
import 'package:assesmentmanushtech/core/storage/product_adapter.dart';
import 'package:assesmentmanushtech/core/util/app_logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:assesmentmanushtech/core/injection/injection_container.dart' as di;
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'core/storage/cart_ietm_adapter.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _firebaseInit();
  await Hive.initFlutter();
  Hive.registerAdapter(CartItemAdapter());  // Register adapter here
  Hive.registerAdapter(ProductsAdapter()); // Register ProductsAdapter

  await di.init();
  await EasyLocalization.ensureInitialized();
  Log.init();

  runApp(EasyLocalization(
      supportedLocales: AppLanguage.all,
      path: AppLanguage.path,
      fallbackLocale: AppLanguage.english,
      startLocale: AppLanguage.english,
      child: const App()));
}

Future<void> _firebaseInit() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseCrashlytics.instance.setCustomKey('Environment', BuildConfig.name);

  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
