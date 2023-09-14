import 'package:e_wallet/src/application.dart';
import 'package:e_wallet/src/di/injectable.dart';
import 'package:e_wallet/src/domain/application_domain/build_config/build_config.dart';
import 'package:e_wallet/src/presentation/features/dependencies/dependencies_provider.dart';
import 'package:e_wallet/src/utils/logger_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setupPrintLogger(enableLogs: BuildConfig().enableLogs);

  runApp(
    const GlobalServicesWrapper(
      onDependenciesInitComplete: FlutterNativeSplash.remove,
      app: EWalletApplication(),
    ),
  );
}

@visibleForTesting
final class GlobalServicesWrapper extends StatelessWidget {
  const GlobalServicesWrapper({
    required this.app,
    required this.onDependenciesInitComplete,
    super.key,
  });

  final Widget app;
  final VoidCallback onDependenciesInitComplete;

  @override
  Widget build(BuildContext context) {
    return DependenciesProvider(
      dependenciesContainer: GlobalDependenciesContainer(),
      onDependenciesInitComplete: onDependenciesInitComplete,
      child: app,
    );
  }
}
