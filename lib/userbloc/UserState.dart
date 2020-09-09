part of 'UserBloc.dart';

abstract class UserState extends Equatable {
  UserState();
  @override
  List<Object> get props => [];
}

class UserInit extends UserState {}

class UserAdded extends UserState {
  UserAdded(this.name, this.gender, this.age, this.id);
  final String name;
  final String gender;
  final int age;
  final int id;
  @override
  List<Object> get props => [name, gender, age, id];
}
