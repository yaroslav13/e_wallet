//ignore_for_file:long-parameter-list
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/src/routes/base_route.dart';
import 'package:navigator/src/routes/named_route.dart';

GoRoute buildRoute({
  required BaseRoute route,
  required GoRouterWidgetBuilder builder,
  List<GoRoute> routes = const [],
  GoRouterRedirect? redirect,
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) {
  return GoRoute(
    path: route.pathFragment,
    name: (route is NamedRoute) ? route.name : null,
    routes: routes,
    redirect: redirect,
    builder: builder,
    parentNavigatorKey: parentNavigatorKey,
  );
}

GoRoute buildRedirectRoute({
  required BaseRoute route,
  required GoRouterRedirect redirect,
  List<GoRoute> routes = const [],
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) {
  return GoRoute(
    path: route.pathFragment,
    name: (route is NamedRoute) ? route.name : null,
    routes: routes,
    redirect: redirect,
    parentNavigatorKey: parentNavigatorKey,
  );
}
