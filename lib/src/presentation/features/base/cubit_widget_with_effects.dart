import 'package:bloc_effects/bloc_effects.dart';
import 'package:e_wallet/src/presentation/features/base/cubit_widget.dart';
import 'package:e_wallet/src/presentation/features/base/effects_helper.dart';

abstract base class CubitWidgetWithEffects<B extends CubitWithEffects<S, E>, S,
    E> extends CubitWidget<B, S> with EffectsHelper<B, S, E> {
  const CubitWidgetWithEffects({super.key});
}
