import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../graphQLBloc/GraphQLBloc.dart';
import '../../graphQLBloc/GraphQLEvents.dart';
import 'LoginConfirmPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = " ";
  String password = " ";
  final TextEditingController _usernameCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  String query = " ";

  @override
  void dispose() {
    _usernameCon.dispose();
    _passwordCon.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("science center login"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(username),
            Text(password),
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
                    query{simpleAuth(_name:"$username", _password:"$password"){
                      id, name, gender, age
                    }}
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
                    query{simpleAuth(_name:"$username", _password:"$password"){
                      id, name, gender, age
                    }}
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
                      child: LoginConfirmPage(),
                    );
                  }));
                },
                child: Text("login"),
              ),
            ),
          ],
        ));
  }
}
