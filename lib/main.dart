import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:science_center_client/timer/TimerBloc.dart';
import 'package:science_center_client/timer/Timer.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => TimerBloc(Timer()),
        child: TestPage(),
      ),
    );
  }
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc with Streams'),
      ),
      body: BlocBuilder<TimerBloc, TimerStates>(
        builder: (context, state) {
          if (state is TimerTickSuccess) {
            return Center(
              child: Text('Tick #${state.count}'),
            );
          }
          return const Center(
            child: Text('Press the floating button to start'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.bloc<TimerBloc>().add(TimerStarted()),
        tooltip: 'Start',
        child: const Icon(Icons.timer),
      ),
    );
  }
}
