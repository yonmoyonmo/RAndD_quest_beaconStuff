import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id); //this.name, this.age, this.gender

  final String id;
  // final String name;
  // final String gender;
  // final int age;

  @override
  List<Object> get props => [id];
}
