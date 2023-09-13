import 'package:logging/logging.dart';
import 'package:logging_interceptor/logging_interceptor.dart';

void setupPrintLogger({
  bool enableLogs = true,
  LoggingInterceptor interceptor = const PrettyPrintLoggingInterceptor(),
}) {
  if (enableLogs) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(interceptor);
  }
}
