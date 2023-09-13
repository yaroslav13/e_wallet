import 'dart:async';
import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
final class CrashlyticsManager {
  CrashlyticsManager(this._crashlytics) {
    _init();
  }

  final FirebaseCrashlytics _crashlytics;

  void _init() {
    _captureFlutterErrors();
    _captureAsyncErrors();
    _captureNonFlutterErrors();
  }

  void _captureFlutterErrors() {
    FlutterError.onError = (errorDetails) {
      unawaited(_crashlytics.recordFlutterFatalError(errorDetails));
    };
  }

  void _captureAsyncErrors() {
    PlatformDispatcher.instance.onError = (error, stack) {
      unawaited(_recordFatalError(error, stack));

      return true;
    };
  }

  void _captureNonFlutterErrors() {
    Isolate.current.addErrorListener(
      RawReceivePort((dynamic pair) async {
        final errorAndStacktrace = pair as List<dynamic>;
        await _recordFatalError(
          errorAndStacktrace.first,
          errorAndStacktrace.last as StackTrace?,
        );
      }).sendPort,
    );
  }

  Future<void> _recordFatalError(
    dynamic exception,
    StackTrace? stackTrace,
  ) {
    return _crashlytics.recordError(exception, stackTrace, fatal: true);
  }
}
