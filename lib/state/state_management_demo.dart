import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: () {
        setState(() {
          _count++;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
        ),
        body: Center(child: CounterWrapper()),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _count++;
            });
          },
        ),
      ),
    );
  }
}

class StateManagementDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateManagementDemoState();
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VoidCallback increaseCount = CounterProvider.of(context).increaseCount;
    int count = CounterProvider.of(context).count;
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({Key key, this.child, this.count, this.increaseCount})
      : super(key: key, child: child);

  final Widget child;
  final VoidCallback increaseCount;
  final int count;

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}


class CounterModel extends Model {

}