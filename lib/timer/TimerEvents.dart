part of 'TimerBloc.dart';

abstract class TimerEvents extends Equatable {
  const TimerEvents();
  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvents {}

class _TimerTicked extends TimerEvents {
  const _TimerTicked(this.timeCount);
  final int timeCount;

  @override
  List<Object> get props => [timeCount];
}
