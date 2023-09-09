import 'package:bloc_effects/bloc_effects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CubitWithEffect<S, E> extends BlocBase<S> with Effects<E> {
  CubitWithEffect(super.state);
}
