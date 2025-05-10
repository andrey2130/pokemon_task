import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_task/core/utils/validator.dart';
import 'package:pokemon_task/feature/auth/presentation/pages/login_page.dart';
import 'package:pokemon_task/feature/auth/presentation/widgets/auth_button.dart';
import 'package:pokemon_task/feature/auth/presentation/widgets/auth_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void _register() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
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
                  child: Image.asset('assets/images/pokemon.png', height: 150),
                ),
                const SizedBox(height: 50),
                AuthTextField(
                  controller: nameController,
                  hintText: 'Name',
                  validator: FormValidators.username,
                ),
                const SizedBox(height: 10),
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
                AuthTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  validator:
                      (value) => FormValidators.confirmPassword(
                        passwordController.text,
                        value ?? '',
                      ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    context.pushNamed('/login');
                  },
                  child: const Text('Already have an account? Login'),
                ),
                AuthButton(text: 'Register', onPressed: _register),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
