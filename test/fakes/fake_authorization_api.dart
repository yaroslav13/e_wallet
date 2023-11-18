import 'package:e_wallet/src/data/api/authorization_api.dart';
import 'package:mockito/mockito.dart';

final class FakeAuthorizationApi extends Fake implements AuthorizationApi {
  @override
  bool get isCurrentUserAuthorized => true;
}
