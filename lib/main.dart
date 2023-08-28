import 'package:e_wallet/src/application.dart';
import 'package:e_wallet/src/di/injectable.dart';
import 'package:e_wallet/src/presentation/features/dependencies/dependencies_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const GlobalServicesWrapper(
    onDependenciesReady: FlutterNativeSplash.remove,
    app: EWalletApplication(),
  ));
}

@visibleForTesting
final class GlobalServicesWrapper extends StatelessWidget {
  const GlobalServicesWrapper({
    required this.app,
    required this.onDependenciesReady,
    super.key,
  });

  final Widget app;
  final VoidCallback onDependenciesReady;

  @override
  Widget build(BuildContext context) {
    return DependenciesProvider(
      dependenciesContainer: GetItContainer(),
      onDependenciesReady: onDependenciesReady,
      child: app,
    );
  }
}
