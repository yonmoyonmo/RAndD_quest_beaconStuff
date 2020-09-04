part of 'UserBloc.dart';

abstract class UserStates extends Equatable {
  const UserStates();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserStates {}
