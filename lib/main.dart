import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/core/route/app_route.dart';
import 'package:pokemon_task/core/theme/app_theme.dart';
import 'package:pokemon_task/feature/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:pokemon_task/firebase_options.dart';
import 'package:pokemon_task/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator(); // Ініціалізуємо ServiceLocator
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBlocBloc>(create: (context) => sl<AuthBlocBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoute.router,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
