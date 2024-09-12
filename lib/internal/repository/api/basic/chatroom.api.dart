import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/domain/chatroom.dart';
import 'package:flutter_clean_arch/internal/repository/api/api_client.dart';

Chatroom _transform(dynamic data) {
  return Chatroom(chatroomId: data["id"], name: data["name"]);
}

Iterable<Chatroom> _transforms(dynamic data) {
  return data.map(_transform);
}

class ChatApiRepository {
  final ApiClient _client = inject<ApiClient>();

  Future<Chatroom> createChatroom(String name) async {
    final res = await _client.dio.post("/rooms", data: {});
    return _transform(res.data);
  }
 
  Future<Iterable<Chatroom>> fetchChatrooms() async {
    final res = await _client.dio.get("/rooms");
    return _transforms(res.data);
  }

  Future<Chatroom> updateChatroom(Chatroom chatroom) async {
    final res = await _client.dio.patch("/rooms/${chatroom.chatroomId}",
        data: {"name": chatroom.name});
    return _transform(res.data);
  }

  Future<void> deleteChatroom(Chatroom chatroom) async {
    await _client.dio.delete("/chatroom/${chatroom.chatroomId}");
  }

  Future<String> openChatroom(Chatroom chatroom) async {
    final res = await _client.dio.delete("/chatroom/${chatroom.chatroomId}");
    return res.data["url"];
  }
}
