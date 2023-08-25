import 'package:e_wallet/src/di/modules/firebase_core_module/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@module
abstract interface class FirebaseCoreModule {
  @preResolve
  Future<FirebaseApp> get firebase => Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
}
