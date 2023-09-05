part of '../theme_creator.dart';

final class _ButtonElevationStateProperty
    extends MaterialStateProperty<double> {
  _ButtonElevationStateProperty({
    required this.valueWhenDisabled,
    required this.valueWhenPressed,
  });

  final double valueWhenDisabled;
  final double valueWhenPressed;

  @override
  double resolve(Set<MaterialState> states) {
    return states.contains(MaterialState.pressed)
        ? valueWhenPressed
        : valueWhenDisabled;
  }
}
