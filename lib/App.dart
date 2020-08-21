import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

import 'package:flutter/material.dart';
import 'beaconBloc/BeaconBloc.dart';

import 'routes/Major3.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final beaconBloc = BeaconBloc();

  @override
  void dispose() {
    super.dispose();
    beaconBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Beacon'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: beaconBloc.macStream,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Center(
                    child: Text(snapshot.data.toString()),
                  )
                ],
              );
            },
          ),
          StreamBuilder(
            stream: beaconBloc.majStream,
            builder: (context, snapshot) {
              if (snapshot.data == 3) {
                return RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Major3()));
                  },
                );
              }
              return Column(
                children: [
                  Center(
                    child: Text(snapshot.data.toString()),
                  )
                ],
              );
            },
          ),
          StreamBuilder(
            stream: beaconBloc.accStream,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Center(
                    child: Text(snapshot.data.toString()),
                  )
                ],
              );
            },
          ),
          StreamBuilder(
            stream: beaconBloc.beaconStream,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Center(
                    child: Text(snapshot.data.toString()),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
