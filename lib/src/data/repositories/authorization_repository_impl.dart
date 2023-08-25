import 'package:e_wallet/src/data/api/authorization_api.dart';
import 'package:e_wallet/src/domain/business_domain/repositories/authorization_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthorizationRepository)
final class AuthorizationRepositoryImpl implements AuthorizationRepository {
  AuthorizationRepositoryImpl(this._authorizationApi);

  final AuthorizationApi _authorizationApi;

  @override
  Future<bool> checkIsCurrentUserAuthorized() =>
      Future.value(_authorizationApi.isCurrentUserAuthorized);
}
