import 'package:go_router/go_router.dart';
import 'package:pokemon_task/feature/auth/presentation/pages/login_page.dart';
import 'package:pokemon_task/feature/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static final router = GoRouter(
    initialLocation: '/register',
    routes: [
      GoRoute(
        path: '/register',
        name: '/register',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const RegisterPage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/login',
        name: '/login',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginPage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
