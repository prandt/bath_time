sealed class TimerState {
  const TimerState({required this.time});

  final int time;
}

final class InitialTimerState extends TimerState {
  const InitialTimerState() : super(time: 0);
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int time) : super(time: time);
}

final class TimerTick extends TimerState {
  const TimerTick(int time) : super(time: time);
}

final class TimerPaused extends TimerState {
  const TimerPaused(int time) : super(time: time);
}
