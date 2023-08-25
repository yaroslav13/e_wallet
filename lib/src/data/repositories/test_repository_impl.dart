import 'package:e_wallet/src/domain/business_domain/repositories/test_repositories.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TestRepository)
final class TestRepositoryImpl implements TestRepository {
  @override
  Future<int> test() {
    return Future.value(1);
  }
}
