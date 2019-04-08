import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('StreamDemo'),
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
//    Stream<int> _streamDemo = Stream.fromFuture(fetchData());

    _streamController = StreamController.broadcast();
    _streamController.stream.listen(onData, onError: (error) {
      debugPrint(error);
    }, onDone: () {
      debugPrint('dddd');
    });

    _streamController.stream.listen(onDataTwo, onError: (error) {
      debugPrint(error);
    }, onDone: () {
      debugPrint('dddd');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
  }

  void onData(int stringData) {
    print(stringData);
  }

  void onDataTwo(int stringData) {
    print('onDataTwo:$stringData');
  }

  Future<int> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return 2;
//    throw 'somme';
  }

  void _addData() async {
    debugPrint('addData');
    int data = await fetchData();
    _streamController.sink.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              initialData: '....',
              builder: (context, snapshot) {
                return Text(snapshot.data.toString());
              },
              stream: _streamController.stream,
            ),
            FlatButton(onPressed: _addData, child: Text('AddData')),
            FlatButton(
                onPressed: () {
                  debugPrint('pause');
                  _streamSubscription.pause();
                },
                child: Text('Pause')),
            FlatButton(
                onPressed: () {
                  debugPrint('Resume');
                  _streamSubscription.resume();
                },
                child: Text('Resume')),
            FlatButton(
                onPressed: () {
                  debugPrint('cancel');
                  _streamSubscription.cancel();
                },
                child: Text('Cancel')),
          ],
        ),
      ),
    );
  }
}
