abstract interface class AuthorizationRepository {
  Future<bool> checkIsCurrentUserAuthorized();
}
