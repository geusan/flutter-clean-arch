import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/domain/user.dart';
import 'package:flutter_clean_arch/repository/api/network/auth.api.dart';

class AuthService {
  final AuthApi _authApi = inject.get<AuthApi>();

  Future<User> signIn({ required String username, required String password }) async {
    final user = await _authApi.login(username, password);
    return user;
  }

  Future<User> signUp({ required String username, required String password }) async {
    final user = await _authApi.login(username, password);
    return user;
  }
}
