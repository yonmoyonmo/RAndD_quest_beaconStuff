part of 'TimerBloc.dart';

abstract class TimerStates extends Equatable {
  const TimerStates();

  @override
  List<Object> get props => [];
}

class TimerInitial extends TimerStates {}

class TimerTickSuccess extends TimerStates {
  const TimerTickSuccess(this.count);
  final int count;

  @override
  List<Object> get props => [count];
}
