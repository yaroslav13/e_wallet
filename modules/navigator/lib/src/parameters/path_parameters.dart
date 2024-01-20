import 'package:flutter/foundation.dart';

@immutable
abstract interface class PathParameters {
  Map<String, String> asMap();
}
