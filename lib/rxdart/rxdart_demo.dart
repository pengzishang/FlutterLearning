import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RxDartDemoHome(),
      appBar: AppBar(
        title: Text('RxDartDemo'),
      ),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _publishSubject;

  @override
  void initState() {
    super.initState();
    _publishSubject = PublishSubject<String>();
    _publishSubject.debounce(Duration(milliseconds: 500)).where((test) {
      return test.length > 5;
    }).map((value) {
      return 'item:>>>>>>$value';
    }).listen((value) {
      debugPrint(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          labelText: 'title',
          filled: true,
        ),
        onChanged: (value) {
          _publishSubject.add(value);
        },
      ),
    );
  }
}
