import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;

  increaseCounter() {
    count++;
    notifyListeners();
  }

  decreaseCounter() {
    count--;
    notifyListeners();
  }
}
