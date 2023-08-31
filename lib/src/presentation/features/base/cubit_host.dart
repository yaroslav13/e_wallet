import 'package:e_wallet/src/presentation/features/dependencies/dependencies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class CubitHost<T extends Cubit<Object?>> extends StatelessWidget {
  const CubitHost({
    required this.builder,
    this.lazy = false,
    this.onCreate,
    super.key,
  });

  final WidgetBuilder builder;
  final void Function(BuildContext, T)? onCreate;

  final bool lazy;

  T _onAttached(BuildContext context) {
    final getIt = DependenciesProvider.of(context);

    final cubit = getIt.get<T>();
    onCreate?.call(context, cubit);

    return cubit;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: _onAttached,
      lazy: lazy,
      child: Builder(
        builder: builder,
      ),
    );
  }
}
