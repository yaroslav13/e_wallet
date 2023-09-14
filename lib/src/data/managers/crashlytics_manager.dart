import 'dart:async';

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
  }

  void _captureFlutterErrors() {
    FlutterError.onError = (errorDetails) {
      unawaited(_crashlytics.recordFlutterFatalError(errorDetails));
    };
  }

  void _captureAsyncErrors() {
    PlatformDispatcher.instance.onError = (error, stack) {
      unawaited(_crashlytics.recordError(error, stack, fatal: true));

      return true;
    };
  }
}
