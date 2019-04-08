import 'package:flutter/material.dart';
import 'PopMenu.dart';
import 'CheckboxDemo.dart';
import 'DateDemo.dart';
import 'SimpleDialogDemo.dart';
import 'ChipDemo.dart';
import 'DataTableDemo.dart';
import 'StepperDemo.dart';
import 'state/state_management_demo.dart';
import 'stream/stream_demo.dart';
void main() => runApp(MyApp());

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  primaryColor: Colors.black,
  accentColor: Colors.black,
  brightness: Brightness.light,
);

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) {
          return Defalut();
        },
        "/popMenu": (context) {
          return PopMenu();
        },
        "/CheckBox": (context) => CheckBoxDemo(),
        "/DateDemo": (context) => DateTimeDemo(),
        '/SimpleDialogDemo': (context) => SimpleDialogDemo(),
        '/AlertDialogDemo': (context) => AlertDialogDemo(),
        '/BottomSheetDemoState' : (context) => BottomSheetDemo(),
        '/SnackBarButton':(context) => SnackBarButton(),
        '/ExpansionPannelDemo':(context)=>ExpansionPannelDemo(),
        '/ChipDemo':(context) => ChipDemo(),
        '/DataTableDemo':(context) => DataTableDemo(),
        '/PaginatedDataTableDemo':(context) => PaginatedDataTableDemo(),
        '/CardDemo':(context) => CardDemo(),
        '/StepperDemo':(context) => StepperDemo(),
        '/StateManagementDemo':(context) => StateManagementDemo(),
        '/StreamDemo':(context) => StreamDemo(),
      },
    );
    return materialApp;
  }
}

class Defalut extends StatelessWidget {
  final Widget child;

  Defalut({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'PopMenu',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/popMenu');
              },
            ),
            ListTile(
              title: Text(
                'CheckBox',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/CheckBox');
              },
            ),
            ListTile(
              title: Text(
                'DateDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/DateDemo');
              },
            ),
            ListTile(
              title: Text(
                'SimpleDialogDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/SimpleDialogDemo');
              },
            ),
            ListTile(
              title: Text(
                'AlertDialogDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/AlertDialogDemo');
              },
            ),
            ListTile(
              title: Text(
                'BottomSheetDemoState',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/BottomSheetDemoState');
              },
            ),
            ListTile(
              title: Text(
                'SnackBarButton',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/SnackBarButton');
              },
            ),
            ListTile(
              title: Text(
                'ExpansionPannelDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/ExpansionPannelDemo');
              },
            ),
            ListTile(
              title: Text(
                'ChipDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/ChipDemo');
              },
            ),
            ListTile(
              title: Text(
                'DataTableDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/DataTableDemo');
              },
            ),
            ListTile(
              title: Text(
                'PaginatedDataTableDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/PaginatedDataTableDemo');
              },
            ),
            ListTile(
              title: Text(
                'CardDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/CardDemo');
              },
            ),
            ListTile(
              title: Text(
                'StepperDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/StepperDemo');
              },
            ),
            ListTile(
              title: Text(
                'StateManagementDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/StateManagementDemo');
              },
            ),
            ListTile(
              title: Text(
                'StreamDemo',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/StreamDemo');
              },
            ),
          ],
        ),
      ),
    );
  }
}
