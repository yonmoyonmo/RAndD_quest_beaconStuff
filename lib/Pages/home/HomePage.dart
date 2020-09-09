import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("login"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text("signup"),
            )
          ],
        ));
  }
}
