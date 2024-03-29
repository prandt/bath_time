import 'package:bath_time/src/ui/views/home_view.dart';
import 'package:bath_time/src/ui/views/login_view.dart';
import 'package:bath_time/src/ui/views/register_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView()
      },
    );
  }
}