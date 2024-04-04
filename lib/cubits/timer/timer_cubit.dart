import 'package:default_project/cubits/timer/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit()
      : super(
    TimerState(
      hour: '01',
      minute: '00',
      error: false,
      stop: false,
    ),
  );

  setHourAndMinute(String hour, String minute) {
    emit(state.copyWith(
        hour: hour.length == 1 ? "0$hour" : hour,
        minute: minute.length == 1 ? "0$minute" : minute));
  }

}