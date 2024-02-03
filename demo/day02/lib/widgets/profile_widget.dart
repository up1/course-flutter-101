import 'package:cached_network_image/cached_network_image.dart';
import 'package:day02/app_service.dart';
import 'package:day02/controllers/user_controller.dart';
import 'package:day02/models/user_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  UserController userController = Get.put(UserController());

  Widget profileCard(UserResponse user) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Text(user.username!),
              CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl: user.image!,
              )
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Profile Screen'),
          Obx(() => userController.user.value.username != null
              ? profileCard(userController.user.value)
              : const SizedBox.shrink()),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => {
              // Remove data from shared preferences
              AppService.instance.removeLogin(),
              // Go back to login screen
              Get.offNamed('/')
            },
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
