sealed class TimerState {
  const TimerState({required this.time});

  final int time;

  @override
  String toString() =>  _millisecondsToTime(time);

  String _millisecondsToTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
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
