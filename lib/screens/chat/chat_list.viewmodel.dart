import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/domain/chatroom.dart';
import 'package:flutter_clean_arch/services/chat/service.dart';

class ChatListViewModel with ChangeNotifier {
  final ChatService _chatService = inject<ChatService>();
  List<Chatroom> chatrooms = [];
  String newChatroomName = 'New Chatroom';

  void setChatroomName(String val) {
    newChatroomName = val;
    notifyListeners();
  }
  
  Future<void> load() async {
    chatrooms = await _chatService.fetchChatrooms();
    notifyListeners();
  }

  Future<void> createChatroom() async {
    // check validation
    print("create $newChatroomName");
    // create
    Chatroom chatroom = await _chatService.createChatroom(newChatroomName);
    chatrooms.add(chatroom);
    newChatroomName = '';
    notifyListeners();
  }

  Future<void> deleteChatroom(int chatId) async {
    await _chatService.deleteChatroom(chatId);
    for (var element in chatrooms) {
      if (element.id == chatId) {
        chatrooms.remove(element);
        break;
      }
    }
    notifyListeners();
  }
}
