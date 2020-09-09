import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../graphQLBloc/GraphQLBloc.dart';
import '../../graphQLBloc/GraphQLStates.dart';

class SignInConfirmPage extends StatefulWidget {
  SignInConfirmPage({Key key}) : super(key: key);

  @override
  _SignInConfirmPageState createState() => _SignInConfirmPageState();
}

class _SignInConfirmPageState extends State<SignInConfirmPage> {
  Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("signinconfirm confirm")),
        body: BlocBuilder<GraphQLBloc, GraphQLStates>(
          builder: (BuildContext context, GraphQLStates state) {
            if (state is Loading) {
              return LinearProgressIndicator();
            } else if (state is LoadDataFail) {
              return Center(
                child: Text("실패!"),
              );
            } else if (state is LoadDataSuccess) {
              data = (state).data['createUser'];
              return Center(
                child: Text(data['name'] +
                    " / " +
                    data['gender'] +
                    ' / ' +
                    data['age'].toString()),
              );
            } else
              return Center(child: LinearProgressIndicator());
          },
        ));
  }
}
