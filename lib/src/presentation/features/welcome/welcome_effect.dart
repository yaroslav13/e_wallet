import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_effect.freezed.dart';

@freezed
class WelcomeEffect with _$WelcomeEffect {
  const factory WelcomeEffect.getStartedPressed({
    required bool shouldUserBeAuthorized,
  }) = _GetStartedPressed;
}
