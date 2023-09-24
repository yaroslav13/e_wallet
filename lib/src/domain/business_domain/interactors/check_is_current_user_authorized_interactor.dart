import 'package:e_wallet/src/domain/base/no_argument_interactor.dart';
import 'package:e_wallet/src/domain/business_domain/repositories/authorization_repository.dart';

final class CheckIsCurrentUserAuthorizedInteractor
    implements NoArgumentInteractor<bool> {
  const CheckIsCurrentUserAuthorizedInteractor(this._authorizationRepository);

  final AuthorizationRepository _authorizationRepository;

  @override
  Future<bool> call() {
    return _authorizationRepository.checkIsCurrentUserAuthorized();
  }
}
