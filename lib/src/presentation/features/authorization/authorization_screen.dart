import 'package:e_wallet/src/presentation/resources/images_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rive/rive.dart';

part 'hooks/rive_animation_controller_hook.dart';

abstract final class _BannerAnimationsIdentifiers {
  _BannerAnimationsIdentifiers._();

  static const phoneAnimationId = 'idle phone';
  static const coinAndClockAnimationId = 'idle coin & clock';
}

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _AnimatedBanner(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class _AnimatedBanner extends HookWidget {
  const _AnimatedBanner();

  @override
  Widget build(BuildContext context) {
    final idlePhoneController = _useRiveAnimationController(
      _BannerAnimationsIdentifiers.phoneAnimationId,
    );
    final idleCoinAndClockController = _useRiveAnimationController(
      _BannerAnimationsIdentifiers.coinAndClockAnimationId,
    );

    return Expanded(
      child: RiveAnimation.asset(
        ImagesSource.moneyRelatedAppRiv,
        controllers: [idlePhoneController, idleCoinAndClockController],
        fit: BoxFit.cover,
      ),
    );
  }
}
