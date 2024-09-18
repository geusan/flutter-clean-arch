import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/domain/noti.dart';
import 'package:flutter_clean_arch/domain/user.dart';
import 'package:flutter_clean_arch/repository/api/network/auth.api.dart';
import 'package:flutter_clean_arch/repository/sqflite/noti.dart';

class AuthService {
  final AuthApi _authApi = inject.get<AuthApi>();
  NotiTable table = NotiTable();

  Future<User> signIn({ required String username, required String password }) async {
    final user = await _authApi.login(username, password);
    return user;
  }

  Future<User> signUp({ required String username, required String password }) async {
    final user = await _authApi.login(username, password);
    return user;
  }
  Future<Iterable<Noti>> getNotifications() async {
    final items = await table.findMany('');
    return items;
  }
}
