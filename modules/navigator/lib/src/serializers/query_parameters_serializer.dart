import 'package:navigator/src/parameters/query_parameters.dart';

abstract interface class QueryParametersSerializer<P extends QueryParameters> {
  P fromQueryParameters(Map<String, dynamic> map);

  Map<String, dynamic> toQueryParameters(P parameters);
}
