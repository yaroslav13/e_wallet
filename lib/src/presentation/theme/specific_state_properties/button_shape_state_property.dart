part of '../theme_creator.dart';

final class _ButtonShapeStateProperty
    extends MaterialStateProperty<OutlinedBorder> {
  _ButtonShapeStateProperty({
    required this.borderRadiusWhenPressed,
    required this.borderRadiusWhenUntouched,
    this.borderRadiusWhenDisabled,
  });

  final double borderRadiusWhenPressed;
  final double borderRadiusWhenUntouched;

  final double? borderRadiusWhenDisabled;

  @override
  OutlinedBorder resolve(Set<MaterialState> states) {
    final double borderRadius;

    final borderRadiusWhenDisabled = this.borderRadiusWhenDisabled;
    if (states.contains(MaterialState.pressed)) {
      borderRadius = borderRadiusWhenPressed;
    } else if (states.contains(MaterialState.disabled) &&
        borderRadiusWhenDisabled != null) {
      borderRadius = borderRadiusWhenDisabled;
    } else {
      borderRadius = borderRadiusWhenUntouched;
    }

    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}
