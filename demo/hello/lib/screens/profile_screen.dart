import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  removeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLogin');
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
              const Text('Profile Screen'),
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
