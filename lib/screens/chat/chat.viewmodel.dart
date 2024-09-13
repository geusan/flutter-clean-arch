import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/services/chat/service.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'chat.viewmodel.g.dart';

@JsonSerializable()
class ChatItem {
  final String role;
  final String content;
  const ChatItem({required this.role, required this.content});

  factory ChatItem.fromJson(Map<String, dynamic> json) =>
      _$ChatItemFromJson(json);
  Map<String, dynamic> toJson() => _$ChatItemToJson(this);
}

class ChatViewModel with ChangeNotifier {
  final ChatService _chatService = inject.get<ChatService>();

  final List<ChatItem> chats = [];

  late WebSocketChannel _socket;

  String input = '';

  void setInput(String val) {
    input = val;
    notifyListeners();
  }

  Future init(int chatId) async {
    final url = await _chatService.openChatSocket(chatId);
    connect(url);
  }

  connect(String url) async {
    _socket = WebSocketChannel.connect(Uri.parse(url));
    _socket.stream.listen((msg) {
      final chatItem = ChatItem.fromJson(jsonDecode(msg));
      chats.add(chatItem);
      notifyListeners();
    });
  }

  send() {
    final item = ChatItem(role: 'me', content: input);
    _socket.sink.add(jsonEncode(item.toJson()));
    input = '';
    notifyListeners();
  }

  disconnect() async {
    await _socket.sink.close();
  }
}
