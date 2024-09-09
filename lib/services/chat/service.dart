import 'package:flutter_clean_arch/domain/chatroom.dart';

class ChatService {
  Chatroom createChatroom(String name) {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    return Chatroom(chatroomId: timestamp, name: name);
  }
  void deleteChatroom(int chatId) {
    return;
  }
  void updateChatroom() {
    return;
  }
  void appendChat() {
    return;
  }
}
