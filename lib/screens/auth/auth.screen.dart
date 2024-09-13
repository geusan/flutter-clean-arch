import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/constants/sizes.dart';
import 'package:flutter_clean_arch/constants/utils.dart';
import 'package:flutter_clean_arch/screens/auth/auth.viewmodel.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AuthViewModel>();
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Padding(
      padding: EdgeInsets.all(Space.space4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            onChanged: (value) => vm.setUsername(value),
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
                label: Text('Username')),
          ),
          16.spaceY,
          TextField(
            controller: _passwordController,
            onChanged: (value) => vm.setPassword(value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
              label: Text('Password'),
            ),
            obscureText: true,
          ),
          32.spaceY,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  vm.register().then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('You can do login'),
                        duration: Duration(seconds: 5)));
                  });
                },
                child: const Text("Sign up")),
            16.spaceX,
            ElevatedButton(
                onPressed: () {
                  vm.signIn().then((_) {
                    Get.toNamed("/chats");
                  });
                },
                child: const Text("Login")),
          ]),
        ],
      ),
    ))));
  }
}
