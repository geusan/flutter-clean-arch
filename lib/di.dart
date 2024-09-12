import 'package:flutter_clean_arch/repository/api/api_provider.dart';
import 'package:flutter_clean_arch/repository/shared_preference/local_storage.dart';
import 'package:flutter_clean_arch/services/auth/service.dart';
import 'package:flutter_clean_arch/services/chat/service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final inject = GetIt.I;

// Setup dependency injection
Future<void> setupDI() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  inject.registerSingleton<LocalStorage>(LocalStorage(prefs));
  inject.registerFactory<ApiProvider>(() => ApiProvider());

  inject.registerFactory<AuthService>(() => AuthService());
  inject.registerFactory<ChatService>(() => ChatService());
}
