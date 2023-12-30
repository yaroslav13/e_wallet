part of '../authorization_screen.dart';

RiveAnimationController<RuntimeArtboard> _useRiveAnimationController(
  String animationName,
) {
  return use(_RiveAnimationControllerHook(animationName: animationName));
}

class _RiveAnimationControllerHook
    extends Hook<RiveAnimationController<RuntimeArtboard>> {
  const _RiveAnimationControllerHook({
    required this.animationName,
  });

  final String animationName;

  @override
  _RiveAnimationControllerHookState createState() =>
      _RiveAnimationControllerHookState();
}

class _RiveAnimationControllerHookState extends HookState<
    RiveAnimationController<RuntimeArtboard>, _RiveAnimationControllerHook> {
  late RiveAnimationController<RuntimeArtboard> _controller;

  @override
  void initHook() {
    super.initHook();
    _controller = SimpleAnimation(hook.animationName);
    _controller.isActive = true;
  }

  @override
  RiveAnimationController<RuntimeArtboard> build(BuildContext context) =>
      _controller;

  @override
  void dispose() {
    _controller
      ..isActive = false
      ..dispose();
    super.dispose();
  }
}
