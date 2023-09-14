import 'package:e_wallet/src/di/injectable.dart';
import 'package:e_wallet/src/presentation/features/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

part 'dependencies_initialization_error_stub.dart';

///TODO: Change it to Stateful widget to avoid extra rebuilds
final class DependenciesProvider extends StatelessWidget {
  const DependenciesProvider({
    required this.dependenciesContainer,
    required this.child,
    this.whenDependenciesInitComplete,
    super.key,
  });

  final DependenciesContainer dependenciesContainer;
  final VoidCallback? whenDependenciesInitComplete;
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
      whenDependenciesInitComplete?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetIt>(
      //ignore: discarded_futures
      future: _initDependencies(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return const _DependenciesInitializationErrorStub();
        }

        return snapshot.hasData
            ? _GetItProvider(
                getIt: snapshot.requireData,
                child: child,
              )
            : const SizedBox.shrink();
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
      create: (_) => getIt,
      child: child,
    );
  }
}
