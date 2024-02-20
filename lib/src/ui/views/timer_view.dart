import 'package:bath_time/src/ui/widgets/custom_buttons.dart';
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
          TimerControls()
        ],
      ),
    );
  }
}

class TimerControls extends StatelessWidget {
  const TimerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            PrimaryButton(text: "Reset", onPressed: () => _blocSetEvent(TimerReset(), context)),
            if (state is InitialTimerState)
              PrimaryButton(onPressed: () => _blocSetEvent(TimerStart(), context), text: "Start"),
            if (state is TimerRunInProgress)
              PrimaryButton(onPressed: () => _blocSetEvent(TimerPause(), context), text: "Pause"),
            if (state is TimerPaused)
              PrimaryButton(onPressed: () => _blocSetEvent(TimerResume(), context), text: "Resume"),
          ],
        );
      },
    );
  }

  void _blocSetEvent(TimerEvent event, BuildContext context) {
    context.read<TimerBloc>().add(event);
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Text(millisecondsToTime(state.time), style: const TextStyle(fontSize: 60));
      }
    );
  }

  String millisecondsToTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int hours = (seconds / 3600).truncate();
    seconds = seconds % 3600;
    int minutes = (seconds / 60).truncate();
    seconds = seconds % 60;
    milliseconds = milliseconds % 1000;


    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    String millisecondsStr = milliseconds.toString().padLeft(3, '0');

    return '$minutesStr:$secondsStr,$millisecondsStr';
  }
}

