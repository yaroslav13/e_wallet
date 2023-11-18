part of 'authorization_api.dart';

final class _AuthorizationApiImpl implements AuthorizationApi {
  const _AuthorizationApiImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  bool get isCurrentUserAuthorized => _firebaseAuth.currentUser != null;
}
