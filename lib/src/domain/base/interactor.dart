abstract interface class Interactor<R, P> {
  Future<R> call(P param);
}
