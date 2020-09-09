import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../graphQLBloc/GraphQLBloc.dart';
import '../../graphQLBloc/GraphQLStates.dart';

class LoginConfirmPage extends StatefulWidget {
  LoginConfirmPage({Key key}) : super(key: key);

  @override
  _LoginConfirmPageState createState() => _LoginConfirmPageState();
}

class _LoginConfirmPageState extends State<LoginConfirmPage> {
  Map<String, dynamic> result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("login confirm")),
        body: BlocBuilder<GraphQLBloc, GraphQLStates>(
          builder: (BuildContext context, GraphQLStates state) {
            if (state is Loading) {
              return LinearProgressIndicator();
            } else if (state is LoadDataFail) {
              return Center(
                child: Text("실패!"),
              );
            } else if (state is LoadDataSuccess) {
              result = (state).data["simpleAuth"];
              if (result != null) {
                return Container(child: Text("로그인 성공"));
              } else {
                return Container(child: Text("로그인 쉴패!"));
              }
            } else
              return Center(
                child: LinearProgressIndicator(),
              );
          },
        ));
  }
}
