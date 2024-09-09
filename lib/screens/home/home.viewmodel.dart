import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter += 1;
    notifyListeners();
  }
}
