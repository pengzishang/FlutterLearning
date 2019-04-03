import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  final Widget child;

  CheckBoxDemo({Key key, this.child}) : super(key: key);

  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxDemo> {
  bool cValue = true;
  int rValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Checkbox(
                value: cValue,
                onChanged: (value) {
                  cValue = value;
                  setState(() {});
                },
              ),
              CheckboxListTile(
                secondary: Icon(Icons.import_contacts),
                value: cValue,
                subtitle: Text('SubData'),
                title: Text('ListTitle111'),
                onChanged: (value) {
                  cValue = value;
                  setState(() {});
                },
              ),
              Radio(
                value: 0,
                groupValue: rValue,
                onChanged: (value) {
                  rValue = value;
                  setState(() {});
                },
                activeColor: Colors.blue,
              ),
              Radio(
                value: 1,
                groupValue: rValue,
                onChanged: (value) {
                  rValue = value;
                  setState(() {});
                },
                activeColor: Colors.blue,
              ),
              RadioListTile(
                title: Text('data'),
                subtitle: Text('2w'),
                value: 3,
                groupValue: rValue,
                onChanged: (value) {
                  rValue = value;
                  setState(() {});
                },
                activeColor: Colors.blue,
                secondary: Icon(Icons.cake),
                selected: rValue == 3,
              ),
              SwitchDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool swV = true;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: true,
      onChanged: (value) {
        setState(() {
          swV = value;
        });
      },
    );
  }
}
