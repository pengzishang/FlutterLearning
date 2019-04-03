import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateDemoState createState() => _DateDemoState();
}

class _DateDemoState extends State<DateTimeDemo> {
  DateTime time = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dateDemo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  DateFormat.yMd().format(time),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  timeOfDay.format(context),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  tooltip: 'Navigation menu',
                  onPressed: () async {
                    DateTime date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2020),
                    );

                    if (date == null) {
                      return;
                    }

                    setState(() {
                      time = date;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.dashboard),
                  tooltip: 'Navigation menu',
                  onPressed: () async {
                    TimeOfDay date = await showTimePicker(
                      context: context,
                      initialTime: timeOfDay,
                    );

                    if (date == null) {
                      return;
                    }

                    setState(() {
                      timeOfDay = date;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
