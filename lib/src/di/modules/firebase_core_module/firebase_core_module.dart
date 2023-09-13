import 'package:e_wallet/src/di/modules/firebase_core_module/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseCoreModule {
  @preResolve
  @singleton
  Future<FirebaseApp> get firebase => Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
}
