class Ticker {
  Stream<int> tick() {
    return Stream.periodic(
      const Duration(seconds: 2),
      (x) => x,
    );
  }
}
