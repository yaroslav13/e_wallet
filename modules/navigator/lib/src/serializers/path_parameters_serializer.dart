import 'package:navigator/src/parameters/path_parameters.dart';

abstract interface class PathParametersSerializer<P extends PathParameters> {
  P fromPathParameters(Map<String, String> map);

  Map<String, String> toPathParameters(P parameters);
}
