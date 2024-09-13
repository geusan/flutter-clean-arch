import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/values/sizes.dart';
import 'package:flutter_clean_arch/domain/chatroom.dart';
import 'package:flutter_clean_arch/screens/chat/chat_list.viewmodel.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  late ChatListViewModel model = Provider.of(context, listen: false);
  TextEditingController newChatNameController =
      TextEditingController(text: 'New Chat');

  @override
  void initState() {
    model.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ChatListViewModel vm = context.watch<ChatListViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("ChatList")),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: vm.chatrooms.length,
                itemBuilder: (contect, index) {
                  Chatroom chatroom = vm.chatrooms[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                    child: GestureDetector(
                      onTap: () => Get.toNamed("/chats/:chatId",
                          arguments: [chatroom.id, chatroom.name]),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Text(chatroom.name),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Padding(
                    padding: EdgeInsets.all(Space.space4),
                    child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            TextField(
                              controller: newChatNameController,
                              onChanged: (value) => vm.setChatroomName(value),
                            ),
                            TextButton(
                                onPressed: () {
                                  vm.createChatroom().then((_) {
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('chatroom is created!'),
                                            duration: Duration(seconds: 5)));
                                  });
                                },
                                child: const Text('Create'))
                          ],
                        )));
              });
        },
        tooltip: "Add Chatroom",
        child: const Icon(Icons.add),
      ),
    );
  }
}
