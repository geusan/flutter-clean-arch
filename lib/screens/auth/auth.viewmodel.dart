import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/services/auth/service.dart';
import 'package:get/get.dart';

class AuthViewModel with ChangeNotifier {
  final AuthService _authService = inject.get<AuthService>();

  String username = "";
  String password = "";

  void setUsername(String username) {
    this.username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future<void> signIn() async {
    await _authService.signIn(username: username, password: password);
  }

  Future<void> register() async {
    
    Get.offNamed("/chats");
  }
}
