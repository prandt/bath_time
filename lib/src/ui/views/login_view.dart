import 'package:bath_time/src/blocs/login/login_bloc.dart';
import 'package:bath_time/src/blocs/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailTextController = TextEditingController();
    final passwordTextController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bath Time'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Column(
              children: [
                Text("Welcome to Bath Time!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Please enter your email to continue.", style: TextStyle(fontSize: 16)),
              ]
            ),
            const SizedBox(height: 50),
            BlocProvider<LoginBloc>(
              create: (_) => LoginBloc(),
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is LoginValidEmail) {
                    return Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(10),
                            child: Text('Welcome, ${state.email}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                        TextField(
                          obscureText: state.isLockPassword,
                          controller: passwordTextController,
                          decoration: InputDecoration(
                            hintText: 'Enter with your password',
                            contentPadding: const EdgeInsets.all(10),
                            prefixIcon: IconButton(onPressed: () => context.read<LoginBloc>().toggleLockPassword(), icon: state.isLockPassword ? const Icon(Icons.lock) : const Icon(Icons.lock_open)),
                            suffixIcon: IconButton(onPressed: () => Navigator.pushNamed(context, '/'), icon: const Icon(Icons.arrow_forward)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    );
                  }
                  return TextField(
                    controller: emailTextController,
                    decoration: InputDecoration(
                      hintText: 'Enter with your email',
                      errorText: state is LoginInvalidEmail ? 'Invalid email' : null,
                      contentPadding: const EdgeInsets.all(10),
                      prefixIcon: const Icon(Icons.email_outlined),
                      suffixIcon: IconButton(onPressed: () => context.read<LoginBloc>().validEmail(emailTextController.text), icon: const Icon(Icons.arrow_forward)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  child: const Text('Register'),
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}