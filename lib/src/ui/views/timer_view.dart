import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/timer/timer_bloc.dart';
import '../../blocs/timer/timer_event.dart';
import '../../blocs/timer/timer_state.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerBloc>(
      create: (_) => TimerBloc(),
      child: const Column(
        children: <Widget>[
          TimerText(),
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        if (state is InitialTimerState) {
          return Center(
            child: Column(
              children: <Widget>[
                const Text('Timer is not running'),
                ElevatedButton(onPressed: () => context.read<TimerBloc>().add(TimerStart()), child: const Text("Start"))
              ],
            ),
          );
        } else if (state is TimerRunInProgress) {
          return Center(
            child: Column(
              children: <Widget>[
                Text('Timer is running: ${state.time}'),
                ElevatedButton(onPressed: () => context.read<TimerBloc>().add(TimerPause()), child: const Text("Pause"))
              ],
            ),
          );
        } else if (state is TimerPaused) {
          return Center(
            child: Column(
              children: <Widget>[
                Text('Timer is paused: ${state.time}'),
                ElevatedButton(onPressed: () => context.read<TimerBloc>().add(TimerResume()), child: const Text("Resume")),
                ElevatedButton(onPressed: () => context.read<TimerBloc>().add(TimerReset()), child: const Text("Reset"))
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('Timer is not running'),
          );
        }
      },
    );
  }
}

