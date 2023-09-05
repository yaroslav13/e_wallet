import 'dart:async';

import 'package:e_wallet/src/di/injectable.config.dart';
import 'package:e_wallet/src/domain/application_domain/build_config/build_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

abstract interface class DependenciesContainer {
  const DependenciesContainer();

  Future<GetIt> get dependencies;
}

@InjectableInit(
  preferRelativeImports: false,
  asExtension: false,
)
final class GetItContainer extends DependenciesContainer {
  factory GetItContainer() {
    return _instance;
  }

  GetItContainer._();

  static final GetItContainer _instance = GetItContainer._();

  @override
  late final Future<GetIt> dependencies = _init();

  Future<GetIt> _init() async {
    if (!BuildConfig.isBuildTypeSupported(appBuildType)) {
      throw ArgumentError('Invalid Build type: $appBuildType');
    }

    return init(GetIt.I, environment: appBuildType);
  }
}
