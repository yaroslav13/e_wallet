import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract interface class CacheModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
