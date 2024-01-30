import 'package:app01/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        scaffoldBackgroundColor:
            Colors.white, // Set the default background color to white
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Calculator'),
        ),
        body: const Calculator(title: 'My Calculator'),
      ),
    );
  }
}
