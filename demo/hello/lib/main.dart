import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello/screens/home_screen.dart';
import 'package:hello/screens/login_screen.dart';
import 'package:hello/screens/main_screen.dart';
import 'package:hello/screens/product_detail_screen.dart';
import 'package:hello/screens/product_listing_screen.dart';
import 'package:hello/services/app_service.dart';

// The route configuration.
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
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

String? _redirect(BuildContext context, GoRouterState state) {
  final isLoggedIn = AppService.instance.isLogged;

  if (!isLoggedIn) {
    return '/';
  } else if (isLoggedIn) {
    return '/main';
  }
  return null;
}
