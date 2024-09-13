import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/screens/splash/splash.viewmodel.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SplashScreen> {
  late SplashViewModel model =
      Provider.of<SplashViewModel>(context, listen: false);
  @override
  void initState() {
    super.initState();
    model.passTime().then((_) {
      goToHomeScreen();
    });
  }

  Future<void> goToHomeScreen() async {
    Get.offNamed("/auth");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("splash screen")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("move to home screen"),
              Consumer<SplashViewModel>(builder: (context, vm, index) {
                return Text("${vm.delay} seconds after");
              }),
            ],
          ),
        ),
      ),
    );
  }
}
