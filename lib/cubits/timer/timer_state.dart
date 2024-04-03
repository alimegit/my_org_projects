abstract class TimerState{}
class TimerLoadingState extends TimerState{
  final double minute;
  TimerLoadingState(this.minute);
}
class TimerStopState extends TimerState{}

class TimerErrorState extends TimerState{
  final String errorCatch;
  TimerErrorState(this.errorCatch);
}