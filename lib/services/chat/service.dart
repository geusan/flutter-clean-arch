import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/domain/chatroom.dart';
import 'package:flutter_clean_arch/repository/api/network/chatroom.api.dart';

class ChatService {
  final ChatroomApi _chatroomApi = inject.get<ChatroomApi>();

  Future<List<Chatroom>> fetchChatrooms() async {
    final chatrooms = await _chatroomApi.getChatrooms();
    return chatrooms;
  }

  Future<Chatroom> createChatroom(String name) async {
    final chatroom = await _chatroomApi.createChatroom(name);
    return chatroom;
  }

  Future<void> deleteChatroom(int chatId) async {
    await _chatroomApi.deleteChatroom(chatId);
  }

  Future<String> openChatSocket(int chatId) async {
    final res = await _chatroomApi.openChatroom(chatId);
    return res.url;
  }
}
