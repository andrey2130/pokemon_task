import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_task/core/utils/validator.dart';
import 'package:pokemon_task/feature/auth/domain/params/login_params.dart';
import 'package:pokemon_task/feature/auth/presentation/bloc/auth_bloc_bloc.dart';
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
      final loginParams = LoginParams(
        email: emailController.text,
        password: passwordController.text,
      );

      context.read<AuthBlocBloc>().add(AuthBlocEvent.signIn(loginParams));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<AuthBlocBloc, AuthBlocState>(
          listener: (context, state) {
            if (state is Authenticated) {
              
              context.go('/home');
            } else if (state is Failure) {
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Stack(
                      children: [
                        Column(
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
                              obscureText: true,
                            ),
                            const SizedBox(height: 10),

                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () {
                                context.pushNamed('/register');
                              },
                              child: const Text(
                                'Don\'t have an account? Register',
                              ),
                            ),
                            AuthButton(
                              text: 'Login',
                              onPressed: state is Loading ? () {} : _login,
                            ),
                          ],
                        ),
                        
                        if (state is Loading)
                          const Center(child: CircularProgressIndicator.adaptive()),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
