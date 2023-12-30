import 'package:navigator/navigator.dart';

abstract final class Routes {
  Routes._();

  static const welcome = _WelcomeRoute();
  static const authorization = _AuthorizationRoute();
}

final class _WelcomeRoute extends NamedRoute {
  const _WelcomeRoute() : super(pathFragment: '/', name: 'welcome');
}

final class _AuthorizationRoute extends NamedRoute {
  const _AuthorizationRoute()
      : super(
          pathFragment: '/authorization',
          name: 'authorization',
        );
}
