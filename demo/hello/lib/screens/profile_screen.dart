import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hello/controllers/user_controller.dart';
import 'package:hello/services/app_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserController userController = Get.put(UserController());

  removeLogin() async {
    AppService.instance.removeLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Profile Screen'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                  'Profile Screen with user =${userController.user.value.username}')),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => {
                  // Remove user login status from shared preference
                  removeLogin(),
                  // Navigate to login page
                  context.replace("/"),
                },
                child: const Text('Log out'),
              ),
            ],
          ),
        ));
  }
}
