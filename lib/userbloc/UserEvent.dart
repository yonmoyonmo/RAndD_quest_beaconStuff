part of 'UserBloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object> get props => [];
}

class AddUser extends UserEvent {
  AddUser(this.name, this.gender, this.age, this.id);
  final String name;
  final String gender;
  final int age;
  final int id;

  @override
  List<Object> get props => [name, gender, age, id];
}
