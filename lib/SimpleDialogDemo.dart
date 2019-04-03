import 'package:flutter/material.dart';

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String ft = "notiong";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SimpleDialogDemo'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(ft),
                  FloatingActionButton(
                    child: Icon(Icons.description),
                    onPressed: () async {
                      final ssdd = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                                title: Text('SimpleDialog'),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    child: Text('data'),
                                    onPressed: () {
                                      Navigator.pop(context, "ss");
                                    },
                                  )
                                ]);
                          });
                      setState(() {
                        ft = ssdd;
                      });
                    },
                  )
                ],
              )
            ],
          ),
        ));
  }
}

enum Action { ok, cancle }

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String ft = "notiong";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AlertDialogDemo'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(ft),
                  FloatingActionButton(
                    child: Icon(Icons.description),
                    onPressed: () async {
                      final ss = await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('AlertDialogDemo'),
                              content: Text('are you sure?'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('option1'),
                                  onPressed: () {
                                    Navigator.pop(context, Action.cancle);
                                  },
                                ),
                                FlatButton(
                                  child: Text('option2'),
                                  onPressed: () {
                                    Navigator.pop(context, Action.ok);
                                  },
                                ),
                              ],
                            );
                          });
                      setState(() {
                        switch (ss) {
                          case Action.cancle:
                            ft = 'cacel';
                            break;
                          case Action.ok:
                            ft = 'ok';
                            break;
                        }
                      });
                    },
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  String ft = "notiong";
  final _bottomKey = GlobalKey<ScaffoldState>();

  // onclick() {
  //   _bottomKey.currentState.showBottomSheet((BuildContext context) {
  //     return BottomAppBar(
  //       child: Container(
  //         height: 90,
  //         width: double.infinity,
  //         color: Colors.cyan,
  //       ),
  //     );
  //   });
  // }

  onshowModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(height: 90, color: Colors.black);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.details),
            // onPressed: () {
            //   _bottomKey.currentState.showBottomSheet((BuildContext context) {
            //     return Container(
            //         height: 90,
            //         width: double.infinity,
            //         color: Colors.cyan,
            //       );
            //   });
            // },
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(height: 90, color: Colors.black);
                },
              );
            }),
        key: _bottomKey,
        appBar: AppBar(
          title: Text('AlertDialogDemo'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(ft),
                ],
              )
            ],
          ),
        ));
  }
}

class SnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBarButton'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlatDemo() //这个地方的context,必须重构出来,否则无法运行
            ],
          )
        ],
      ),
    );
  }
}

class FlatDemo extends StatelessWidget {
  const FlatDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('SnackBarButton'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text('data'),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Text(':2'),
              )
            ],
          ),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ));
      },
    );
  }
}

class ExpansionPannelDemo extends StatefulWidget {
  @override
  _ExpansionPannelDemoState createState() => _ExpansionPannelDemoState();
}

class _ExpansionPannelDemoState extends State<ExpansionPannelDemo> {
  bool isExpanded = false;
  List<ExListItem> _exLists;

  @override
  void initState() {
    super.initState();
    _exLists = [
      ExListItem(true,
          headerText: "a",
          exBody: Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text('ExpansionPanel a'),
              ))),
      ExListItem(true,
          headerText: "b",
          exBody: Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text('ExpansionPanel b'),
              ))),
      ExListItem(true,
          headerText: "c",
          exBody: Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text('ExpansionPanel c'),
              ))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ExpansionPannelDemo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
                expansionCallback: (int index, bool isEEE) {
                  setState(() {
                    _exLists[index].isEx = !_exLists[index].isEx;
                  });
                },
                children: _exLists.map((ExListItem item) {
                  return ExpansionPanel(
                    isExpanded: item.isEx,
                    headerBuilder: (BuildContext context,bool isExxxx){
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Text(item.headerText),
                      );
                    },
                    body: item.exBody
                  );
                }).toList()),
          ],
        ));
  }
}

class ExListItem {
  bool isEx = false;
  String headerText;
  Widget exBody;

  ExListItem(this.isEx, {this.exBody, this.headerText});
}
