abstract class TimerEvent {}

final class TimerStart extends TimerEvent {}

final class TimerTicked extends TimerEvent {
  TimerTicked(this.time);
  final int time;
}

final class TimerPause extends TimerEvent {}

final class TimerResume extends TimerEvent {}

final class TimerReset extends TimerEvent {}