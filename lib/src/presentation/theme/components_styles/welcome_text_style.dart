import 'package:flutter/material.dart';

@immutable
final class WelcomeTextStyle extends ThemeExtension<WelcomeTextStyle> {
  const WelcomeTextStyle({
    this.titleStyle,
    this.bodyStyle,
  });

  final TextStyle? titleStyle;
  final TextStyle? bodyStyle;

  @override
  ThemeExtension<WelcomeTextStyle> copyWith({
    TextStyle? titleStyle,
    TextStyle? bodyStyle,
  }) {
    return WelcomeTextStyle(
      titleStyle: titleStyle ?? this.titleStyle,
      bodyStyle: bodyStyle ?? this.bodyStyle,
    );
  }

  @override
  ThemeExtension<WelcomeTextStyle> lerp(
    covariant ThemeExtension<WelcomeTextStyle>? other,
    double t,
  ) {
    if (other is! WelcomeTextStyle) {
      return this;
    }

    return WelcomeTextStyle(
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t),
      bodyStyle: TextStyle.lerp(bodyStyle, other.bodyStyle, t),
    );
  }
}
