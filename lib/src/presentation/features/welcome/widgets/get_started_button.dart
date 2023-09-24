part of '../welcome_screen.dart';

final class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(context.localizations.getStarted),
      ),
    );
  }
}
