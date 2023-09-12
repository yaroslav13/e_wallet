part of '../navigation_controller_extension.dart';

abstract final class _PathParameterExtractor {
  _PathParameterExtractor._();

  static final pattern = RegExp(r':(\w+)(\((?:\\.|[^\\()])+\))?');
}

final class _NavigationController {
  const _NavigationController(this._context);

  final BuildContext _context;

  void navigateNamed(
    NamedRoute route, {
    PathParameters? pathParameters,
    QueryParameters? queryParameters,
  }) {
    final transformedQueryParameters = <String, dynamic>{};
    final transformedPathParameters = <String, String>{};

    if (queryParameters != null) {
      transformedQueryParameters
          .addAll(_serializeRouteQueryParameters(route, queryParameters));
    }

    if (pathParameters != null) {
      transformedPathParameters
          .addAll(_serializeRoutePathParameters(route, pathParameters));
    }

    _context.goNamed(
      route.name,
      queryParameters: transformedQueryParameters,
      pathParameters: transformedPathParameters,
    );
  }

  void navigate(
    List<BaseRoute> routesSequence, {
    PathParameters? pathParameters,
    QueryParameters? queryParameters,
  }) {
    assert(routesSequence.isNotEmpty, "Routes list can't be empty");
    assert(
      routesSequence.first.pathFragment.startsWith('/') &&
          routesSequence.slice(1).every(
                (path) => !path.pathFragment.startsWith('/'),
              ),
      'Only first route must be root',
    );

    final transformedPathParameters = <String, String>{};
    final transformedQueryParameters = <String, dynamic>{};

    final endpoint = routesSequence.last;

    if (pathParameters != null) {
      transformedPathParameters
          .addAll(_serializeRoutePathParameters(endpoint, pathParameters));
    }

    if (queryParameters != null) {
      transformedQueryParameters
          .addAll(_serializeRouteQueryParameters(endpoint, queryParameters));
    }

    //ignore: prefer_asserts_with_message
    assert(() {
      final paramNames = _extractPathParametersNames(endpoint.pathFragment);
      for (final paramName in paramNames) {
        assert(
          transformedPathParameters.containsKey(paramName),
          'missing param "$paramName" for ${endpoint.pathFragment}',
        );
      }

      return true;
    }());

    final encodedPathParameters =
        _encodeEachPathParameter(transformedPathParameters);

    final pathFragments = routesSequence.map((route) => route.pathFragment);

    _context.go(
      Uri(
        path: _joinPathFragments(pathFragments, encodedPathParameters),
        queryParameters: transformedQueryParameters.isEmpty
            ? null
            : transformedQueryParameters,
      ).toString(),
    );
  }

  Uri get currentLocation => GoRouterState.of(_context).uri;

  List<String> _extractPathParametersNames(String pattern) {
    final pathParametersNames = <String>[];

    for (final match in _PathParameterExtractor.pattern.allMatches(pattern)) {
      //ignore: avoid-non-null-assertion
      pathParametersNames.add(match[1]!);
    }

    return pathParametersNames;
  }

  Map<String, dynamic> _serializeRouteQueryParameters(
    BaseRoute route,
    QueryParameters queryParameters,
  ) {
    assert(
      route is QueryParametersSerializer,
      '$route have to be mixed with QueryParametersSerializers',
    );

    final serializer = route as QueryParametersSerializer;

    return serializer.toQueryParameters(queryParameters);
  }

  Map<String, String> _serializeRoutePathParameters(
    BaseRoute route,
    PathParameters pathParameters,
  ) {
    assert(
      route is PathParametersSerializer,
      '$route have to be mixed with PathParametersSerializer',
    );

    final serializer = route as PathParametersSerializer;

    return serializer.toPathParameters(pathParameters);
  }

  Map<String, String> _encodeEachPathParameter(
    Map<String, String> pathParameters,
  ) {
    return <String, String>{
      for (final param in pathParameters.entries)
        param.key: Uri.encodeComponent(param.value),
    };
  }

  String _joinPathFragments(
    Iterable<String> fragments,
    Map<String, String> pathParameters,
  ) {
    final absolutePathPattern = fragments.join('/');

    final buffer = StringBuffer();
    var start = 0;
    for (final match in _PathParameterExtractor.pattern.allMatches(
      absolutePathPattern,
    )) {
      if (match.start > start) {
        buffer.write(absolutePathPattern.substring(start, match.start));
      }

      //ignore: avoid-non-null-assertion
      final name = match[1]!;
      buffer.write(pathParameters[name]);
      start = match.end;
    }

    if (start < absolutePathPattern.length) {
      buffer.write(absolutePathPattern.substring(start));
    }

    return buffer.toString();
  }
}
