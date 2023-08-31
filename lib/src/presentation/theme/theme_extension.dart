import 'package:flutter/material.dart';

final class _TextTheming {
  const _TextTheming({
    required this.extraBigText,
    required this.bigText,
    required this.mainText,
    required this.buttonText,
    required this.titleText,
    required this.subtitleText,
    required this.headingText,
    required this.enlargedMainText,
  });

  final TextStyle? extraBigText;
  final TextStyle? bigText;
  final TextStyle? mainText;
  final TextStyle? buttonText;
  final TextStyle? titleText;
  final TextStyle? subtitleText;
  final TextStyle? headingText;
  final TextStyle? enlargedMainText;
}

extension ThemeX on BuildContext {
  //ignore:library_private_types_in_public_api
  _TextTheming get textTheme {
    final textTheme = Theme.of(this).textTheme;

    return _TextTheming(
      extraBigText: textTheme.displayLarge,
      bigText: textTheme.displayMedium,
      mainText: textTheme.bodyMedium,
      buttonText: textTheme.labelMedium,
      titleText: textTheme.headlineMedium,
      subtitleText: textTheme.titleMedium,
      headingText: textTheme.titleSmall,
      enlargedMainText: textTheme.bodyLarge,
    );
  }

  T getThemeExtension<T>() {
    return Theme.of(this).extensions[T] as T;
  }
}
