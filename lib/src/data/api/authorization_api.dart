import 'package:firebase_auth/firebase_auth.dart';

final class AuthorizationApi {
  AuthorizationApi(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  bool get isCurrentUserAuthorized => _firebaseAuth.currentUser != null;
}
