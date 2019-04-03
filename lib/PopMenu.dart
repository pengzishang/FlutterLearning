import 'package:flutter/material.dart';

class ColumnValue extends StatefulWidget {
  @override
  _ColumnState createState() => _ColumnState();
}

class PopMenu extends StatelessWidget {
  final Widget child;

  PopMenu({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: ColumnValue());
  }
}

class _ColumnState extends State<ColumnValue> {
  String stringvalue = 'home';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(stringvalue),
        Center(
          child: PopupMenuButton(
            onSelected: (value) {
              setState(() {
                stringvalue = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('data'),
                  value: 'data1',
                ),
                PopupMenuItem(
                  child: Text('data2'),
                  value: 'data2',
                )
              ];
            },
          ),
        )
      ],
    );
  }
}
