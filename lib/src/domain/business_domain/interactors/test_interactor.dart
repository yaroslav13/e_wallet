import 'package:e_wallet/src/domain/base/interactor.dart';
import 'package:e_wallet/src/domain/business_domain/repositories/test_repositories.dart';

final class TestInteractor implements Interactor<int, int> {
  const TestInteractor(this._repository);

  final TestRepository _repository;

  @override
  Future<int> call(int param) {
    return _repository.test();
  }
}
