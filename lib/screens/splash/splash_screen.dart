import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    decrementTimer();
  }

  int timer = 5;

  Future<void> decrementTimer() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      timer--;
    });
    if (timer > 0) {
      await decrementTimer();
    } else {
      await goToHomeScreen();
    }
  }

  Future<void> goToHomeScreen() async {
    Get.offNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("splash screen")),
      body: Expanded(
        child: Center(
          child: Column(
            children: [
              const Text("move to home screen"),
              Text("$timer seconds after")
            ],
          ),
        ),
      ),
    );
  }
}
