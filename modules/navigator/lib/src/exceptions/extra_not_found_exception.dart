final class ExtraNotFoundException<T> implements Exception {
  const ExtraNotFoundException();

  @override
  String toString() {
    return "Extra of type $T doesn't found";
  }
}
