import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
final class AuthorizationApi {
  AuthorizationApi(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  bool get isCurrentUserAuthorized => _firebaseAuth.currentUser != null;
}
