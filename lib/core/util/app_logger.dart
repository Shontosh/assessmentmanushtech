
import 'package:assesmentmanushtech/app/build_config.dart';
import 'package:logger/logger.dart';

class Log {
  static late Logger _logger;

  static void init() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 8,
        lineLength: 500,
        colors: true,
        printEmojis: true,
      ),
      level: _getLogLevel(),
    );
  }

  static Level _getLogLevel() {
    if (BuildConfig.buildType == BuildType.production) {
      return Level.error;
    } else if (BuildConfig.buildType == BuildType.staging) {
      return Level.all;
    } else {
      return Level.all;
    }
  }

  static void d(Object? message) => _logger.d(message);
  static void i(Object? message) => _logger.i(message);
  static void w(Object? message) => _logger.w(message);
  static void e(Object? message, [StackTrace? stackTrace]) =>
      _logger.e(message, stackTrace: stackTrace);
}
