part of '../welcome_screen.dart';

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
