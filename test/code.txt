import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';
import 'package:science_center_client/beaconBloc/BeaconBloc.dart';
import 'package:science_center_client/beaconFootPrint/BeaconFootPrint.dart';
import 'package:science_center_client/timer/TimerBloc.dart';
import 'package:science_center_client/timer/Timer.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BeaconFootPrint>(
      create: (context) => BeaconFootPrint(),
      child: MaterialApp(
        title: "science center client test",
        home: BlocProvider(
          create: (_) => TimerBloc(Timer())..add(TimerStarted()),
          child: Test(),
        ),
      ),
    );
  }
}

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  BeaconBloc beaconBloc = BeaconBloc();
  @override
  void dispose() {
    super.dispose();
    beaconBloc.dispose();
  }

  int index;
  @override
  void initState() {
    super.initState();
    index = 0;
  }

  void autoStart(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final beaconFootPrint = Provider.of<BeaconFootPrint>(context);
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: Center(
          child: StreamBuilder(
            stream: beaconBloc.majStream,
            builder: (context, snapshot) {
              if (snapshot != null &&
                  !snapshot.hasError &&
                  snapshot.data != null) {
                if (beaconFootPrint.footPrint[index] != snapshot.data) {
                  SchedulerBinding.instance.addPostFrameCallback(
                      (_) => beaconFootPrint.addFootPrint(snapshot.data));
                  SchedulerBinding.instance
                      .addPostFrameCallback((_) => setState(() {
                            index++;
                          }));
                }
              }
              return Column(children: [
                Text(snapshot.data.toString()),
                Text("footPrint: " +
                    '${beaconFootPrint.getBeaconFootPrint().toString()}'),
                BlocBuilder<TimerBloc, TimerStates>(
                  builder: (context, state) {
                    if (state is TimerTickSuccess) {
                      return Text("${state.count}");
                    }
                    return Text("timer test");
                  },
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
