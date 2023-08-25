import 'package:e_wallet/src/di/injectable.dart';
import 'package:e_wallet/src/presentation/theme/theme_creator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

part 'dependencies_initialization_error_stub.dart';

class DependenciesProvider<T extends DependenciesContainer>
    extends StatefulWidget {
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

  @override
  State<DependenciesProvider> createState() => _DependenciesProviderState();
}

class _DependenciesProviderState<T extends DependenciesContainer>
    extends State<DependenciesProvider<T>> {
  late final _dependencies = _initDependencies();

  Future<GetIt> _initDependencies() async {
    try {
      final dependencies = await widget.dependenciesContainer.dependencies;
      return dependencies;
    } on Exception {
      rethrow;
    } finally {
      widget.onDependenciesReady?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetIt>(
      future: _dependencies,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return const _DependenciesInitializationErrorStub();
        }

        final data = snapshot.data;
        if (data != null) {
          return _GetItProvider(
            getIt: data,
            child: widget.child,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
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
