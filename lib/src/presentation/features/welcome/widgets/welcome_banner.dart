part of '../welcome_screen.dart';

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
