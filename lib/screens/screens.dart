import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/screens/auth/auth.screen.dart';
import 'package:flutter_clean_arch/screens/chat/chat_list.screen.dart';
import 'package:flutter_clean_arch/screens/chat/chat.screen.dart';
import 'package:flutter_clean_arch/screens/home/home.screen.dart';
import 'package:flutter_clean_arch/screens/splash/splash.screen.dart';
import 'package:flutter_clean_arch/screens/theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';


class Screens extends StatelessWidget {
  const Screens({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ko"),
        Locale("en"),
      ],
      builder: EasyLoading.init(),
      initialRoute: "/splash",
      getPages: [
        GetPage(
          name: "/splash",
          page: () => const SplashScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: "/auth",
          page: () => AuthScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: "/chats",
          page: () => const ChatListScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: "/chats/:chatId",
          page: () => const ChatScreen(),
          transition: Transition.rightToLeft,
        ),
      ],
    );
  }
}
