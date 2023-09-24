import 'package:bloc_effects/bloc_effects.dart';
import 'package:e_wallet/src/presentation/features/base/cubit_helper.dart';
import 'package:flutter/material.dart';

base mixin EffectsHelper<B extends CubitWithEffects<S, E>, S, E>
    on CubitHelper<B, S> {
  Widget listenEffects({
    required EffectWidgetListener<E> listener,
    required Widget child,
  }) {
    return BlocEffectListener<B, E>(
      listener: listener,
      child: child,
    );
  }
}
