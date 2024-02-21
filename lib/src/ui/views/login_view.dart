import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter with your email',
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: IconButton(onPressed: () => Navigator.pushNamed(context, '/'), icon: const Icon(Icons.arrow_forward)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
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