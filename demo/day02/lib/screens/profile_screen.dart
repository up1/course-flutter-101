import 'package:day02/app_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  // Remove data from shared preferences
                  AppService.instance.removeLogin(),
                  // Go back to login screen
                  context.replace('/')
                },
                child: const Text('Log out'),
              ),
            ],
          ),
        ));
  }
}
