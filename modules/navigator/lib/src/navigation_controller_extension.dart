import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/src/navigation_state.dart';
import 'package:navigator/src/parameters/path_parameters.dart';
import 'package:navigator/src/parameters/query_parameters.dart';
import 'package:navigator/src/routes/base_route.dart';
import 'package:navigator/src/routes/named_route.dart';
import 'package:navigator/src/serializers/path_parameters_serializer.dart';
import 'package:navigator/src/serializers/query_parameters_serializer.dart';

part 'navigation_controller.dart';

extension NavigationControllerX on BuildContext {
  //ignore:library_private_types_in_public_api
  _NavigationController get navigator => _NavigationController(this);

  NavigationState get navigationState => NavigationState.from(this);
}
