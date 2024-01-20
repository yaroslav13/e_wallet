import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/src/exceptions/extra_not_found_exception.dart';

base class NavigationState {
  const NavigationState._({
    required this.location,
    required this.pathParameters,
    required this.pageKey,
  });

  final Uri location;
  final Map<String, String> pathParameters;
  final ValueKey<String> pageKey;

  //ignore: prefer_constructors_over_static_methods
  static NavigationState from(BuildContext context) {
    final state = GoRouterState.of(context);

    return NavigationState._(
      location: state.uri,
      pathParameters: state.pathParameters,
      pageKey: state.pageKey,
    );
  }

  static NavigationStateWithExtra<E> withExtraFrom<E>(
    BuildContext context,
  ) {
    final state = maybeWithExtraFrom<E>(context);

    if (state.extra == null) {
      throw ExtraNotFoundException<E>();
    }

    return state;
  }

  static NavigationStateWithExtra<E> maybeWithExtraFrom<E>(
    BuildContext context,
  ) {
    final state = GoRouterState.of(context);

    final extra = state.extra;

    return NavigationStateWithExtra<E>._(
      location: state.uri,
      pathParameters: state.pathParameters,
      pageKey: state.pageKey,
      extra: extra is E ? extra : null,
    );
  }

  /// Returns 'true' if route has query params.
  bool get hasQueryParams => location.hasQuery;

  ///The path is the actual substring of the URI representing the path.
  String get path => location.path;

  Map<String, String> get queryParameters => location.queryParameters;
}

final class NavigationStateWithExtra<E> extends NavigationState {
  const NavigationStateWithExtra._({
    required super.location,
    required super.pathParameters,
    required super.pageKey,
    required this.extra,
  }) : super._();

  final E? extra;

  static NavigationStateWithExtra<Object> fromGoRouterState(
    GoRouterState state,
  ) {
    return NavigationStateWithExtra<Object>._(
      location: state.uri,
      pathParameters: state.pathParameters,
      pageKey: state.pageKey,
      extra: state.extra,
    );
  }

  E get requireExtra {
    final extra = this.extra;
    if (extra != null) {
      return extra;
    }
    throw StateError('NavigationBundle has no extra param');
  }

  bool get hasExtra => extra != null;
}
