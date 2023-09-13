import 'dart:io';

import 'package:logging/logging.dart';
import 'package:logging_interceptor/src/logging_interceptor.dart';
import 'package:meta/meta.dart';

@immutable
final class PrettyPrintLoggingInterceptor implements LoggingInterceptor {
  const PrettyPrintLoggingInterceptor();

  @override
  void call(LogRecord log) {
    stdout.writeln('[${log.level.name}] ${log.loggerName}: ${log.message}');

    if (log.error != null) {
      stdout.writeln('${log.error}');
    }

    if (log.stackTrace != null) {
      _printStack(
        //ignore: avoid-non-null-assertion
        stackTrace: log.stackTrace!,
        maxFrames: 100,
      );
    }
  }

  void _printStack({required StackTrace stackTrace, int? maxFrames}) {
    Iterable<String> lines = stackTrace.toString().trimRight().split('\n');

    if (lines.isNotEmpty) {
      lines = lines.skipWhile((line) {
        return line.contains('StackTrace.current') ||
            line.contains('dart-sdk/lib/_internal') ||
            line.contains('dart:sdk_internal');
      });
    }
    if (maxFrames != null) {
      lines = lines.take(maxFrames);
    }

    lines.forEach(stdout.writeln);
  }
}
