import 'dart:async';

import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  int delay = 5;

  Future<void> passTime() async {
    await Future.delayed(const Duration(seconds: 1));

    delay--;
    notifyListeners();
    if (delay > 0) {
      return passTime();
    }
    return;
  }
}
