import 'package:e_wallet/src/presentation/features/base/cubit_host.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget cubitScreen<T extends Cubit<Object?>>(
  Widget child, {
  RouteSettings? settings,
  void Function(T)? onCreate,
  bool lazy = false,
}) =>
    CubitHost<T>(
      builder: (_) => child,
      onCreate: (_, cubit) => onCreate?.call(cubit),
      lazy: lazy,
    );
