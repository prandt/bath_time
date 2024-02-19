import 'dart:async';

import 'package:bath_time/src/blocs/timer/timer_event.dart';
import 'package:bath_time/src/blocs/timer/timer_state.dart';
import 'package:bloc/bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {

  TimerBloc(): super(const InitialTimerState()) {
    on<TimerStart>((event, emit) => _onStart(event, emit));
    on<TimerTicked>((event, emit) => _onTick(event, emit));
    on<TimerPause>((event, emit) => _onPause(event, emit));
    on<TimerResume>((event, emit) => _onResume(event, emit));
    on<TimerReset>((event, emit) => _onReset(event, emit));
  }

  StreamSubscription<int>? _timerSubscription;

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }

  void _onStart(TimerStart event, Emitter<TimerState> emit)  {
    _timerSubscription?.cancel();
    _timerSubscription = Stream.periodic(const Duration(seconds: 1), (x) => x)
        .listen((time) => add(TimerTicked(time)));
  }

  void _onTick(TimerTicked event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(event.time));
  }

  void _onPause(TimerPause event, Emitter<TimerState> emit) {
    _timerSubscription?.pause();
    emit(TimerPaused(state.time));
  }

  void _onResume(TimerResume event, Emitter<TimerState> emit) {
    _timerSubscription?.resume();
    emit(TimerRunInProgress(state.time));
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _timerSubscription?.cancel();
    emit(const InitialTimerState());
  }

}