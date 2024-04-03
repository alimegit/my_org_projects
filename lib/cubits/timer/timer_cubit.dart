import 'package:default_project/cubits/timer/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerLoadingState(1.0));

  Timer? _timer;

  void start(double minutes) {
    emit(TimerLoadingState(minutes));
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutes > 0) {
        minutes -= 1.0;
        emit(TimerLoadingState(minutes));
      } else {
        emit(TimerStopState());
        _timer?.cancel();
      }
    });
  }

  void stop() {
    _timer?.cancel();
    emit(TimerStopState());
  }

  void setError(String error) {
    emit(TimerErrorState(error));
  }
}
