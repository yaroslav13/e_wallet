import 'package:e_wallet/src/presentation/theme/components_styles/welcome_text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract base class ThemeCreator {
  const ThemeCreator();

  @factoryMethod
  factory ThemeCreator.required() = _RegularThemeCreator;

  @nonVirtual
  ThemeData create() {
    return ThemeData.from(
      colorScheme: _colorScheme,

      ///TODO: Add license for font 'Oswald'
      textTheme: GoogleFonts.oswaldTextTheme(_textTheme),
      useMaterial3: false,
    ).copyWith(
      elevatedButtonTheme: _elevatedButtonTheme,
      extensions: [
        _welcomeTextStyle,
      ],
    );
  }

  ColorScheme get _colorScheme;

  //You could configure everything except font family. It would be 'Nunito'.
  TextTheme get _textTheme;

  ElevatedButtonThemeData get _elevatedButtonTheme;

  WelcomeTextStyle get _welcomeTextStyle;
}

final class _RegularThemeCreator extends ThemeCreator {
  const _RegularThemeCreator();

  @override
  ColorScheme get _colorScheme => ColorScheme.light(
      // primary: _lima,
      // secondary: _phthaloBlue,
      // tertiary: _aero,
      // error: _red,
      // surface: _aluminum,
      // onSurface: _lima,
      );

  @override
  TextTheme get _textTheme => const TextTheme().copyWith(
        displayLarge: const TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w700,
        ),

        //Used for the date in the dialog shown by [showDatePicker]
        displayMedium: TextStyle(
          fontSize: 24,
          color: _white,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        //Used for material [AppBar.title]
        titleLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: _cornflowerBlue,
        ),

        ///Used for material [ListTile.title]
        titleMedium: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),

        ///Used for material [ElevatedButton, TextButton, OutlinedButton]
        labelLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),

        //The default text style for [Material]
        bodyMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      );

  @override
  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
        enableFeedback: true,
        foregroundColor: MaterialStateProperty.all(_cornflowerBlue),
        elevation: _ButtonElevationStateProperty(
          valueWhenDisabled: 8,
          valueWhenPressed: 4,
        ),
        shape: _ButtonShapeStateProperty(
          borderRadiusWhenPressed: 30,
          borderRadiusWhenUntouched: 10,
          borderRadiusWhenDisabled: 5,
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  @override
  WelcomeTextStyle get _welcomeTextStyle => WelcomeTextStyle(
        titleStyle: _textTheme.titleLarge,
        bodyStyle: _textTheme.bodyLarge,
      );

  Color get _aeroBlue => const Color(0xffD7FFF1);

  Color get _white => const Color(0xffffffff);

  Color get _cornflowerBlue => const Color(0xff728ae5);

  Color get _black => const Color(0xff000000);
}

///TODO: Separate it to other file using part/ part of.
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
