import 'package:navigator/navigator.dart';

abstract final class Routes {
  Routes._();

  static const welcome = _WelcomeRoute();
}

final class _WelcomeRoute extends NamedRoute {
  const _WelcomeRoute() : super(pathFragment: '/', name: 'welcome');
}
