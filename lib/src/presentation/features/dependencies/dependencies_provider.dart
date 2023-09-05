import 'package:e_wallet/src/di/injectable.dart';
import 'package:e_wallet/src/presentation/features/utils/localization_extension.dart';
import 'package:e_wallet/src/presentation/theme/theme_creator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

part 'dependencies_initialization_error_stub.dart';

final class DependenciesProvider<T extends DependenciesContainer>
    extends StatelessWidget {
  const DependenciesProvider({
    required this.dependenciesContainer,
    required this.child,
    this.onDependenciesReady,
    super.key,
  });

  final T dependenciesContainer;
  final VoidCallback? onDependenciesReady;
  final Widget child;

  static GetIt of(BuildContext context) {
    return Provider.of<GetIt>(context, listen: false);
  }

  Future<GetIt> _initDependencies() async {
    try {
      final dependencies = await dependenciesContainer.dependencies;

      return dependencies;
    } on Exception {
      rethrow;
    } finally {
      onDependenciesReady?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final dependenciesInitializer = useMemoized(() => _initDependencies);

    //ignore: discarded_futures
    final dependenciesSnapshot = useFuture(dependenciesInitializer());

    if (dependenciesSnapshot.hasError) {
      return const _DependenciesInitializationErrorStub();
    }

    final data = dependenciesSnapshot.data;

    return data != null
        ? _GetItProvider(getIt: data, child: child)
        : const SizedBox.shrink();
  }
}

class _GetItProvider extends StatelessWidget {
  const _GetItProvider({
    required this.getIt,
    required this.child,
  });

  final GetIt getIt;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Provider<GetIt>(
      lazy: false,
      create: (_) => getIt,
      child: child,
    );
  }
}
