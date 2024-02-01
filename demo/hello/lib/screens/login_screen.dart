import 'package:flutter/material.dart';
import 'package:hello/widgets/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: LoginWidget(
          passwordVisible: _passwordVisible,
          onPasswordVisibilityToggle: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ));
  }
}
