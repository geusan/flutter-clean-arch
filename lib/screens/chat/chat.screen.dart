import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/screens/chat/chat.viewmodel.dart';
import 'package:flutter_clean_arch/values/sizes.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatViewModel model = Provider.of<ChatViewModel>(context, listen: false);
  TextEditingController inputContrller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model.init(4);
      // model.init(Get.arguments[0] as int);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat screen")),
      body: Padding(
          padding: EdgeInsets.all(Space.space4),
          child: Column(
            children: [
              Consumer<ChatViewModel>(builder: (context, vm, child) {
                return Expanded(
                    child: ListView.builder(
                      reverse: true,
                  itemCount: vm.chats.length,
                  itemBuilder: (context, index) {
                    final chat = vm.chats[vm.chats.length - index - 1];
                    return Container(
                      padding:
                          EdgeInsets.fromLTRB(0, Space.space2, 0, Space.space2),
                      child: Row(
                        children: [
                          Text("${chat.role}: "),
                          Text(chat.content),
                        ],
                      ),
                    );
                  },
                ));
              }),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: inputContrller,
                      onChanged: (value) => model.setInput(value),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        model.send();
                        inputContrller.clear();
                      },
                      icon: const Icon(Icons.add))
                ],
              )
            ],
          )),
    );
  }
}
