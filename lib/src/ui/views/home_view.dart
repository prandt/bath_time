import 'package:bath_time/src/ui/views/timer_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bath Time'),
        actions: [
          IconButton(
            icon: const Icon(Icons.login_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          )],
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: const TimerView()
      )
    );
  }
}
