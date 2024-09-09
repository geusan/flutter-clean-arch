import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/domain/chatroom.dart';
import 'package:flutter_clean_arch/services/chat/service.dart';

class ChatListViewModel with ChangeNotifier {
  final ChatService _chatService = inject<ChatService>();
  List<Chatroom> chatrooms = [];

  createChatroom(String name) {
    // check validation
    print("create $name");
    // create
    Chatroom chatroom = _chatService.createChatroom(name);
    chatrooms.add(chatroom);
    
    notifyListeners();
  }

  deleteChatroom(int chatId) {
    _chatService.deleteChatroom(chatId);
    for (var element in chatrooms) {
      if (element.chatroomId == chatId) {
        chatrooms.remove(element);
        break;
      }
    }
    notifyListeners();
  }
}
