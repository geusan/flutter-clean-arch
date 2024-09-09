import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch/domain/chat.dart';

class ChatViewModel with ChangeNotifier {
  List<Chat> chats = [];
  late Socket _socket;

  connect() async {
    _socket = await Socket.connect("ws://127.0.0.1", 8081);
    _socket.listen((event) {
      print(event);
    });
  }

  disconnect() async {
    await _socket.close();
  }
}