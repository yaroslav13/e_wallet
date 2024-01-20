import 'package:flutter/foundation.dart';

@immutable
abstract interface class QueryParameters {
  Map<String, dynamic> asMap();
}
