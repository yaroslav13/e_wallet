import 'package:flutter/foundation.dart';

@immutable
abstract base class BaseRoute {
  const BaseRoute({required this.pathFragment});

  final String pathFragment;
}
