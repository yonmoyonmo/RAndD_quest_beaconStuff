import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'Timer.dart';

part 'TimerEvents.dart';
part 'TimerStates.dart';

class TimerBloc extends Bloc<TimerEvents, TimerStates> {
  TimerStates get initialState => TimerInitial();
  TimerBloc(this._timer) : super(null);
  final Timer _timer;
  StreamSubscription _subscription;
  @override
  Stream<TimerStates> mapEventToState(TimerEvents event) async* {
    if (event is TimerStarted) {
      await _subscription?.cancel();
      _subscription = _timer.tick().listen((tick) => add(_TimerTicked(tick)));
    }
    if (event is _TimerTicked) {
      yield TimerTickSuccess(event.timeCount);
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
