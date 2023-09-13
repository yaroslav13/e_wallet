import 'package:e_wallet/src/domain/application_domain/build_config/build_type.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

const appBuildType = String.fromEnvironment('BUILD_TYPE');

@injectable
@immutable
class BuildConfig {
  @factoryMethod
  factory BuildConfig() {
    final currentBuildType = BuildType.fromValue(appBuildType);

    return switch (currentBuildType) {
      BuildType.dev => BuildConfig._dev(),
      BuildType.prod => BuildConfig._prod(),
    };
  }

  const BuildConfig._({
    required this.enableLogs,
    required this.enableMultiscreenPreview,
  });

  factory BuildConfig._dev() {
    return const BuildConfig._(
      enableLogs: true,
      enableMultiscreenPreview: kDebugMode,
    );
  }

  factory BuildConfig._prod() {
    return const BuildConfig._(
      enableLogs: false,
      enableMultiscreenPreview: false,
    );
  }

  static bool isBuildTypeSupported(String name) {
    return BuildType.values.asNameMap().containsKey(name);
  }

  final bool enableLogs;
  final bool enableMultiscreenPreview;
}
