import 'package:flutter/material.dart';
import 'package:web_service/auth/requests/login.dart';
import 'package:web_service/auth/requests/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: TextField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(27),
                          hintText: "login",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: loginController,
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: const Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(27),
                          hintText: "password",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: passwordController,
                      ),
                    ),
                  ],
                ),
              ),
              FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                login(loginController.text, passwordController.text);
              }),
              FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                register(loginController.text, passwordController.text);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
