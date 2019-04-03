import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tag = ["apple", "pen", "applePen"];
  List<String> _select = [];
  String _onchoice = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _tag = ["apple", "pen", "applePen"];
            _select = [];
            _onchoice = "";
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            // crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Chip(
                label: Text('data'),
              ),
              Chip(
                label: Text('data'),
                backgroundColor: Colors.orange,
              ),
              Chip(
                label: Text('data'),
                backgroundColor: Colors.orange,
                avatar: CircleAvatar(
                  child: Icon(Icons.cake),
                  backgroundColor: Colors.orange,
                ),
              ),
              Chip(
                label: Text('data'),
                backgroundColor: Colors.orange,
                avatar: CircleAvatar(
                  // child: Icon(Icons.cake),
                  backgroundColor: Colors.orange,
                  backgroundImage:
                      NetworkImage('https://pic3.zhimg.com/4d0346277_l.jpg'),
                ),
              ),
              Chip(
                label: Text('data'),
                backgroundColor: Colors.orange,
                avatar: CircleAvatar(
                  // child: Icon(Icons.cake),
                  backgroundColor: Colors.orange,
                  backgroundImage:
                      NetworkImage('https://pic3.zhimg.com/4d0346277_l.jpg'),
                ),
              ),
              Chip(
                label: Text('city'),
                onDeleted: () {},
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.blue,
                backgroundColor: Colors.orange,
                avatar: CircleAvatar(
                  // child: Icon(Icons.cake),
                  backgroundColor: Colors.orange,
                  backgroundImage:
                      NetworkImage('https://pic3.zhimg.com/4d0346277_l.jpg'),
                ),
              ),
              Divider(
                color: Colors.green,
                height: 10,
                indent: 20,
              ),
              Wrap(
                  spacing: 10,
                  children: _tag.map((item) {
                    return Chip(
                      label: Text(item),
                      onDeleted: () {
                        setState(() {
                          _tag.remove(item);
                        });
                      },
                    );
                  }).toList()),
              Divider(
                color: Colors.green,
                height: 10,
                indent: 20,
              ),
              Wrap(
                  spacing: 10,
                  children: _tag.map((item) {
                    return ActionChip(
                      avatar: CircleAvatar(
                          // child: Icon(Icons.delete),
                          ),
                      padding: EdgeInsets.all(10),
                      label: Text(item),
                      onPressed: () {
                        setState(() {
                          _tag.remove(item);
                        });
                      },
                    );
                  }).toList()),
              Divider(
                color: Colors.green,
                height: 10,
                indent: 20,
              ),
              Wrap(
                  spacing: 10,
                  children: _tag.map((item) {
                    return FilterChip(
                      padding: EdgeInsets.all(10),
                      label: Text(item),
                      onSelected: (isSelect) {
                        setState(() {
                          _select.contains(item)
                              ? _select.remove(item)
                              : _select.add(item);
                        });
                      },
                      selected: _select.contains(item),
                    );
                  }).toList()),
              Divider(
                color: Colors.green,
                height: 10,
                indent: 20,
              ),
              Wrap(
                  spacing: 10,
                  children: _tag.map((item) {
                    return ChoiceChip(
                      padding: EdgeInsets.all(10),
                      label: Text(item),
                      onSelected: (isSelect) {
                        setState(() {
                          _onchoice = item;
                        });
                      },
                      selected: _onchoice == item,
                    );
                  }).toList()),
            ],
          )
        ],
      ),
    );
  }
}
