import 'package:day02/app_service.dart';
import 'package:day02/controllers/database_controller.dart';
import 'package:day02/controllers/product_controller.dart';
import 'package:day02/controllers/user_controller.dart';
import 'package:day02/screens/home_screen.dart';
import 'package:day02/screens/login_screen.dart';
import 'package:day02/screens/main_screen.dart';
import 'package:day02/screens/product_detail_screen.dart';
import 'package:day02/screens/product_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  redirect: _redirect,
  refreshListenable: AppService.instance,
  navigatorKey: AppService.instance.navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'main',
          builder: (BuildContext context, GoRouterState state) {
            return const MainScreen();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'product_listing',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductListingScreen();
          },
        ),
        GoRoute(
          path: 'product/:id',
          builder: (BuildContext context, GoRouterState state) {
            // get value from path or query string
            var id = state.pathParameters['id'] ?? '';
            return ProductDetailScreen(productId: id);
          },
        )
      ],
    ),
  ],
);

String? _redirect(BuildContext context, GoRouterState state) {
  final isLoggedIn = AppService.instance.isLogged;

  if (!isLoggedIn && state.matchedLocation != '/') {
    return '/';
  } else if (isLoggedIn && state.matchedLocation == '/') {
    return '/main';
  }
  return null;
}

void main() {
  Get.put(UserController());
  Get.put(ProductController());
  Get.put(DatabaseController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Day 02',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        unknownRoute: GetPage(name: '/', page: () => const LoginScreen()),
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => const LoginScreen(),
          ),
          GetPage(
            name: '/main',
            page: () => const MainScreen(),
          ),
        ]);
  }
}
