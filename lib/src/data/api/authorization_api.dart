import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

part 'authorization_api_impl.dart';

@injectable
abstract interface class AuthorizationApi {
  @factoryMethod
  factory AuthorizationApi(FirebaseAuth firebaseAuth) = _AuthorizationApiImpl;

  bool get isCurrentUserAuthorized;
}
