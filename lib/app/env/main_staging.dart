import '../../main.dart' as runner;
import '../build_config.dart';

Future<void> main() async {
  BuildConfig.buildType = BuildType.staging;
  await runner.main();
}
