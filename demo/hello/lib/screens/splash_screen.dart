import 'package:flutter/material.dart';
import 'package:hello/screens/home_screen.dart';
import 'package:hello/screens/login_screen.dart';
import 'package:hello/screens/main_screen.dart';
import 'package:hello/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogged = false;

  @override
  void initState() {
    // Check login status in shared preference
    // If user is logged in, navigate to main page
    // If user is not logged in, navigate to login page
    super.initState();
    checkLoggedIn();
  }

  void checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bool result = ((prefs.getBool('isLogin') ?? false));
      isLogged = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: isLogged ? const MainScreen() : const LoginScreen());
  }
}
