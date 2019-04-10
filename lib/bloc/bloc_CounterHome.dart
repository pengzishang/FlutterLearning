import 'package:flutter/material.dart';
import 'bloc_demo.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder(
            initialData: 0,
            stream: //等于listen to
                CounterProvider.of(context).log.counterActionController.stream,
            builder: (context, snapShot) {
              return ActionChip(
                label: Text('${snapShot.data}'),
                onPressed: () {
                  CounterProvider.of(context).log.addValue(1);
                },
              );
            }));
  }
}

//13392449491
//120222199501016279
