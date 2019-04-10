import 'package:flutter/material.dart';
import 'bloc_demo.dart';

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (context, snapShot) {
      return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          CounterProvider.of(context).log.addValue(1);
        },
      );
    });
  }
}
