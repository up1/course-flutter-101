import 'package:day02/app_service.dart';
import 'package:day02/models/user_response.dart';
import 'package:day02/services/user_service.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class UserController extends GetxController {
  final UserService _userService = UserService();
  final user = UserResponse().obs;
  final isLoading = false.obs;

  void loginUser(String username, String password) async {
    isLoading.value = true;
    try {
      // Call API
      final UserResponse userResponse =
          await _userService.loginUser(username, password);
      user.value = userResponse;

      // Save login
      AppService.instance.saveLogin();

      // Navigate to main page
      GoRouter.of(AppService.instance.navigatorKey.currentContext!)
          .replace('/main');
    } catch (e) {
      // TODO :: Handle the error
      print('Failed to login: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
