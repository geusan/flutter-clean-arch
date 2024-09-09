import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/screens/chat/chat_list.viewmodel.dart';
import 'package:flutter_clean_arch/screens/home/home.viewmodel.dart';
import 'package:flutter_clean_arch/screens/screens.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  // dependency injection
  setupDI();
  // intialize loading
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..userInteractions = false
    ..dismissOnTap = true
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.black.withOpacity(0.5);

  EasyLoading.init();

  // initialize shared preferences, sqflite or anything to configure before starting app.

  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ChatListViewModel(),
        ),
      ],
      child: const Screens(),
    );
  }
}
