part of '../welcome_screen.dart';

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
