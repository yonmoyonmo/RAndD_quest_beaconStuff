import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login/LoginPage.dart';
import 'home/HomePage.dart';
import 'signup/SignUpPage.dart';
import '../userbloc/UserBloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(UserInit()),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
        },
      ),
    );
  }
}
