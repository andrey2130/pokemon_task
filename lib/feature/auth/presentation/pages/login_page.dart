import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_task/core/utils/validator.dart';
import 'package:pokemon_task/feature/auth/presentation/widgets/auth_button.dart';
import 'package:pokemon_task/feature/auth/presentation/widgets/auth_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'pokemon_logo',
                  child: Image.asset(
                    'assets/images/login_pokemon.png',
                    height: 150,
                  ),
                ),
                const SizedBox(height: 50),

                AuthTextField(
                  controller: emailController,
                  hintText: 'Email',
                  validator: FormValidators.email,
                ),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  validator: FormValidators.password,
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    context.pushNamed('/register');
                  },
                  child: const Text('Don\'t have an account? Register'),
                ),
                AuthButton(text: 'Login', onPressed: _login),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
