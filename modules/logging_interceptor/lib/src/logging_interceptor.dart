import 'package:logging/logging.dart';

abstract interface class LoggingInterceptor {
  void call(LogRecord log);
}
