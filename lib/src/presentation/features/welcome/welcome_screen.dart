import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_wallet/src/presentation/features/utils/localization_extension.dart';
import 'package:e_wallet/src/presentation/resources/images_source.dart';
import 'package:e_wallet/src/presentation/theme/components_styles/welcome_text_style.dart';
import 'package:e_wallet/src/presentation/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _WelcomeBanner(),
            _WelcomeText(),
            _GetStartedButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

final class _WelcomeBanner extends StatelessWidget {
  const _WelcomeBanner();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SvgPicture.asset(ImagesSource.welcomePageBannerSvg),
    );
  }
}

final class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;
    final style = context.getThemeExtension<WelcomeTextStyle>();

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NonRepeatableTyperAnimatedText(
              localization.ewallet,
              textStyle: style.titleStyle,
            ),
            const SizedBox(height: 10),
            _NonRepeatableTyperAnimatedText(
              localization.improveYourSpendingManagement,
              textStyle: style.bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}

final class _NonRepeatableTyperAnimatedText extends StatelessWidget {
  const _NonRepeatableTyperAnimatedText(
    this.text, {
    this.textStyle,
  });

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      animatedTexts: [
        TyperAnimatedText(
          text,
          textStyle: textStyle,
          speed: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}

///TODO: Implement button.
final class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(context.localizations.getStarted),
      ),
    );
  }
}
