import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/domain/chatroom.dart';
import 'package:flutter_clean_arch/internal/repository/api/api_client.dart';

Chatroom _transform(dynamic data) {
  return Chatroom(chatroomId: data["id"], name: data["name"]);
}

Iterable<Chatroom> _transforms(dynamic data) {
  return data.map(_transform);
}

class AuthApiRepository {
  final ApiClient _client = inject<ApiClient>();

  Future<Chatroom> register(String name, String password) async {
    final res = await _client.dio.post("/register", data: {});
    return _transform(res.data);
  }
 
  Future<Iterable<Chatroom>> login() async {
    final res = await _client.dio.post("/login");
    return _transforms(res.data);
  }
}
