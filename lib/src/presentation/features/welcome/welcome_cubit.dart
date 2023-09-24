import 'package:bloc_effects/bloc_effects.dart';
import 'package:e_wallet/src/domain/business_domain/interactors/check_is_current_user_authorized_interactor.dart';
import 'package:e_wallet/src/presentation/features/welcome/welcome_effect.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'welcome_cubit.freezed.dart';
part 'welcome_state.dart';

final class WelcomeCubit extends CubitWithEffects<WelcomeState, WelcomeEffect> {
  WelcomeCubit(
    this._checkIsCurrentUserAuthorizedInteractor,
  ) : super(const WelcomeState());

  final CheckIsCurrentUserAuthorizedInteractor
      _checkIsCurrentUserAuthorizedInteractor;

  Logger get _logger => Logger('WelcomeCubit #${identityHashCode(this)}');

  Future<void> onGetStartedPressed() async {
    final isUserAuthorized = await _checkIsCurrentUserAuthorizedInteractor();
    _logger.info('onGetStartedPressed -> isUserAuthorized: $isUserAuthorized');

    emitEffect(
      WelcomeEffect.getStartedPressed(
        shouldUserBeAuthorized: !isUserAuthorized,
      ),
    );
  }
}
