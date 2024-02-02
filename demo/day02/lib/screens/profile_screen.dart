import 'package:flutter/material.dart';

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
                  // Go back to login screen
                },
                child: const Text('Log out'),
              ),
            ],
          ),
        ));
  }
}
