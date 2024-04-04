
class TimerState {
  String hour;
  String minute;
  bool error;
  bool stop;
  TimerState(
      {required this.hour,
        required this.minute,
        required this.error,
        required this.stop});

  TimerState copyWith({
    String? hour,
    String? minute,
    bool? error,
    bool? stop,
  }) {
    return TimerState(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      error: error ?? this.error,
      stop: stop ?? this.stop,
    );
  }
}
