import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_wallet/src/presentation/features/base/cubit_widget_with_effects.dart';
import 'package:e_wallet/src/presentation/features/utils/localization_extension.dart';
import 'package:e_wallet/src/presentation/features/welcome/welcome_cubit.dart';
import 'package:e_wallet/src/presentation/features/welcome/welcome_effect.dart';
import 'package:e_wallet/src/presentation/resources/images_source.dart';
import 'package:e_wallet/src/presentation/theme/components_styles/welcome_text_style.dart';
import 'package:e_wallet/src/presentation/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'widgets/get_started_button.dart';
part 'widgets/no_repeatable_typer_animated_text.dart';
part 'widgets/welcome_banner.dart';
part 'widgets/welcome_text.dart';

final class WelcomeScreen
    extends CubitWidgetWithEffects<WelcomeCubit, WelcomeState, WelcomeEffect> {
  const WelcomeScreen({super.key});

  void _handleEffects(
    BuildContext context,
    WelcomeEffect effect,
  ) {
    effect.when(
      getStartedPressed: (shouldUserBeAuthorized) {
        ///TODO: navigate to [LoginScreen] or [HomeScreen]
        ///depending on [shouldUserBeAuthorized]
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final welcomeCubit = cubit(context);

    return listenEffects(
      listener: _handleEffects,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const _WelcomeBanner(),
              const _WelcomeText(),
              _GetStartedButton(onPressed: welcomeCubit.onGetStartedPressed),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
