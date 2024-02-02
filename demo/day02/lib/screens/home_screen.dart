import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home Screen'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Home Screen'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => {},
          currentIndex: 2,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Profile',
            ),
          ],
        ));
  }
}
