import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/core/route/app_route.dart';
import 'package:pokemon_task/core/theme/bloc/theme_bloc.dart';
import 'package:pokemon_task/feature/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:pokemon_task/firebase_options.dart';
import 'package:pokemon_task/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  setupServiceLocator(prefs: prefs);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBlocBloc>(
          create: (context) {
            final authBloc = sl<AuthBlocBloc>();
            authBloc.add(const AuthBlocEvent.initializeAuthState());
            return authBloc;
          },
        ),
        BlocProvider<ThemeBloc>(
          create:
              (context) => sl<ThemeBloc>()..add(const ThemeEvent.loadTheme()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          final authBloc = context.read<AuthBlocBloc>();
          return MaterialApp.router(
            routerConfig: AppRoute.getRouter(authBloc),
            theme: themeState.themeData,
          );
        },
      ),
    );
  }
}
