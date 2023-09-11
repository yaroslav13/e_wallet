import 'package:navigator/src/routes/base_route.dart';

abstract base class NamedRoute extends BaseRoute {
  const NamedRoute({required this.name, required super.pathFragment});

  final String name;
}
