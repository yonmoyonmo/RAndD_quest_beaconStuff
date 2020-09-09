import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../graphQLBloc/GraphQLBloc.dart';
import '../../graphQLBloc/GraphQLEvents.dart';
import 'SignInConfirmPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String username = "";
  String password = "";
  String gender = "";
  int age = 0;
  String query = "";
  final TextEditingController _usernameCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final TextEditingController _genderCon = TextEditingController();
  final TextEditingController _ageCon = TextEditingController();
  @override
  void dispose() {
    _usernameCon.dispose();
    _passwordCon.dispose();
    _genderCon.dispose();
    _ageCon.dispose();
    super.dispose();
  }

  void _submittedUsername(String text) {
    setState(() {
      username = text;
    });
  }

  void _submittedPassword(String text) {
    setState(() {
      password = text;
    });
  }

  void _submittedGender(String text) {
    setState(() {
      gender = text;
    });
  }

  void _submittedInt(String text) {
    setState(() {
      age = int.parse(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("science center login"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(username),
            Text(password),
            Text(gender),
            Text(age.toString()),
            Text(query),
            Container(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _usernameCon,
                decoration: InputDecoration(labelText: "your name or nickname"),
                onSubmitted: _submittedUsername,
                onChanged: (text) {
                  setState(() {
                    username = text;
                    query = '''
                            mutation{
  createUser(data:{
    name: "$username",
    password:"$password"
    gender:"$gender",
    age: $age
  }){
    id
    name
    gender
    age
    password
  }
}
                            ''';
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _passwordCon,
                obscureText: true,
                decoration: InputDecoration(labelText: "password"),
                onSubmitted: _submittedPassword,
                onChanged: (text) {
                  setState(() {
                    password = text;
                    query = '''
                            mutation{
  createUser(data:{
    name: "$username",
    password:"$password"
    gender:"$gender",
    age: $age
  }){
    id
    name
    gender
    age
    password
  }
}
                            ''';
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _genderCon,
                decoration: InputDecoration(labelText: "your gender"),
                onSubmitted: _submittedGender,
                onChanged: (text) {
                  setState(() {
                    gender = text;
                    query = '''
                            mutation{
  createUser(data:{
    name: "$username",
    password:"$password"
    gender:"$gender",
    age: $age
  }){
    id
    name
    gender
    age
    password
  }
}
                            ''';
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _ageCon,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "your age"),
                onSubmitted: _submittedInt,
                onChanged: (text) {
                  setState(() {
                    age = int.parse(text);
                    query = '''
                            mutation{
  createUser(data:{
    name: "$username",
    password:"$password"
    gender:"$gender",
    age: $age
  }){
    id
    name
    gender
    age
    password
  }
}
                            ''';
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BlocProvider<GraphQLBloc>(
                      create: (BuildContext context) =>
                          GraphQLBloc()..add(FetchGQLData(query)),
                      child: SignInConfirmPage(),
                    );
                  }));
                },
                child: Text("signup"),
              ),
            ),
          ],
        ));
  }
}
