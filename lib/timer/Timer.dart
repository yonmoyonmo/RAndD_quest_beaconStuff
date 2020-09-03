import 'dart:async';

class Timer {
  Stream<int> tick() {
    return Stream.periodic(const Duration(seconds: 1), (x) => x);
  }
}
