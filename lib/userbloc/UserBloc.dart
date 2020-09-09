import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';

part 'UserEvent.dart';
part 'UserState.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState initialState) : super(initialState);
  UserState get initialState => UserInit();
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is AddUser) {
      yield UserAdded(event.name, event.gender, event.age, event.id);
    }
  }
}
