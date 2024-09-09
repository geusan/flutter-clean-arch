import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/screens/home/home.viewmodel.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel vm = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Home screen ${vm.counter}")),
      body: Center(
        child: Column(
          children: [
            const Text("Welcome!"),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/chats");
              },
              child: const Text("Go to Chatrooms"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.incrementCounter();
        },
        tooltip: "Increment title",
        child: const Icon(Icons.add),
      ),
    );
  }
}
