import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('StateManagementDemo'),
          ),
          body: Center(child: CounterWrapper()),
          floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, _, model) {
              return FloatingActionButton(
                  child: Icon(Icons.add), onPressed: model.increasedCount);
            },
          )),
    );
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
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) {
        return ActionChip(
          label: Text('${model.count}'),
          onPressed: model.increasedCount,
        );
      },
    );
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increasedCount() {
    _count++;
    notifyListeners();
  }
}
