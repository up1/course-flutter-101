import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hello/controllers/user_controller.dart';
import 'package:hello/services/app_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<StatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formLoginKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
          key: _formLoginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                validator: (value) => value!.isEmpty ? 'Enter username' : null,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                validator: (value) => value!.isEmpty ? 'Enter password' : null,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => {
                  // Working with navigation to product listing page
                  // User go route
                  if (_formLoginKey.currentState!.validate())
                    {
                      // Call login api
                      userController.loginUser(
                        usernameController.text,
                        passwordController.text,
                      )
                    }
                },
                child: Obx(
                  () => userController.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                ),
              ),
            ],
          )),
    );
  }
}
