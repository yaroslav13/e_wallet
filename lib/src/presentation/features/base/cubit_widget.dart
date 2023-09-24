import 'package:e_wallet/src/presentation/features/base/cubit_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract base class CubitWidget<B extends Cubit<S>, S> extends StatelessWidget
    with CubitHelper<B, S> {
  const CubitWidget({super.key});
}
