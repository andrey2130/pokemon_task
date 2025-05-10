import 'package:go_router/go_router.dart';
import 'package:pokemon_task/feature/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:pokemon_task/feature/auth/presentation/pages/login_page.dart';
import 'package:pokemon_task/feature/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_task/feature/home/presentation/pages/main_navigation_page.dart';
import 'package:pokemon_task/feature/leaderboard/presentation/pages/leaderboard_page.dart';
import 'package:pokemon_task/feature/leaderboard/presentation/bloc/leaderboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/service_locator.dart';
import 'dart:async';

class AppRoute {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter getRouter(AuthBlocBloc authBloc) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/register',
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        final isAuthenticated = authBloc.state is Authenticated;

        final isLoginRoute = state.matchedLocation == '/login';
        final isRegisterRoute = state.matchedLocation == '/register';

        
        if (isAuthenticated && (isLoginRoute || isRegisterRoute)) {
          return '/home';
        }

        if (!isAuthenticated && !isLoginRoute && !isRegisterRoute) {
          return '/login';
        }

        return null;
      },
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
        GoRoute(
          path: '/home',
          name: '/home',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const MainNavigationPage(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          },
        ),
        GoRoute(
          path: '/leaderboard',
          name: '/leaderboard',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => sl<LeaderboardBloc>(),
                child: const LeaderboardPage(),
              ),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
