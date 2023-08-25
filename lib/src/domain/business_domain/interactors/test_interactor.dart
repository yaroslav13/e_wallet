import 'package:e_wallet/src/domain/base/interactor.dart';
import 'package:e_wallet/src/domain/business_domain/repositories/test_repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
final class TestInteractor implements Interactor<int, int> {
  TestInteractor(this._repository);

  final TestRepository _repository;

  @override
  Future<int> call(int param) {
    return _repository.test();
  }
}
