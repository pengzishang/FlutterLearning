import 'package:flutter/material.dart';
import 'bloc_CounterActionButton.dart';
import 'bloc_CounterHome.dart';
import 'dart:async';

class BlocDemo extends StatefulWidget {
  @override
  _BlocDemoState createState() => _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemo> {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      log: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
        ),
        floatingActionButton: CounterActionButton(),
        body: CounterHome(),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({this.child, this.log}) : super(child: child);

  final Widget child;
  final CounterBloc log;

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _countValue = 0;
  final counterActionController = StreamController<int>();

//  final counterController = StreamController<int>();
//  StreamSink<int> get counter => counterController.sink;

//  CounterBloc() {
//    counterActionController.stream.listen((value) {
//      debugPrint(value.toString());
//      counter.add(_countValue);
//    });
//  }

  void dispose(){
    counterActionController.close();
//    counterController.close();
  }

  void addValue(int value) {
    _countValue += value;
    counterActionController.sink.add(_countValue);
  }

}
