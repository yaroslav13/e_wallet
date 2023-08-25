import 'package:e_wallet/src/presentation/features/dependencies/dependencies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitHost<T extends Cubit<Object?>> extends StatelessWidget {
  const CubitHost({
    required this.builder,
    this.lazy = false,
    this.onCreate,
    Key? key,
  }) : super(key: key);

  final WidgetBuilder builder;
  final Function(BuildContext, T)? onCreate;

  final bool lazy;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (context) {
        final getIt = DependenciesProvider.of(context);

        final cubit = getIt.get<T>();
        onCreate?.call(context, cubit);

        return cubit;
      },
      lazy: lazy,
      child: Builder(
        builder: builder,
      ),
    );
  }
}
