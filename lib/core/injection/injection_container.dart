import 'package:get_it/get_it.dart';
import 'injections.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //* Core
  initCore();

  //* Startup
  initStartup();

  //* Authentication
  initAuth();

  //* Home
  initHome();
}
