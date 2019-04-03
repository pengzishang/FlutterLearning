import 'package:flutter/material.dart';
import 'post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortIndex = 0;
  bool _sortAscending = false;

  @override
  void initState() {
    super.initState();
    debugPrint(posts[1].author.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DataTableDemo'),
        ),
        body: Container(
            child: ListView(children: <Widget>[
          DataTable(
            sortColumnIndex: _sortIndex,
            sortAscending: _sortAscending,
            columns: [
              DataColumn(
                  label: Container(
                    child: Text('Title'),
                    width: 80,
                  ),
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortIndex = index;
                      _sortAscending = !_sortAscending;
                      posts.sort((a, b) {
                        return _sortAscending
                            ? a.title.length.compareTo(b.title.length)
                            : b.title.length.compareTo(a.title.length);
                      });
                    });
                  }),
              DataColumn(
                  label: Container(
                child: Text('Author'),
                width: 60,
              )),
              DataColumn(
                  label: Text('Image'),
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortIndex = index;
                      _sortAscending = !_sortAscending;
                      posts.sort((a, b) {
                        return _sortAscending
                            ? a.imageUrl.length.compareTo(b.imageUrl.length)
                            : b.imageUrl.length.compareTo(a.imageUrl.length);
                      });
                    });
                  }),
            ],
            rows: posts.map((item) {
              return DataRow(
                  cells: [
                    DataCell(Text(item.title)),
                    DataCell(Text(item.author)),
                    DataCell(Image.network(item.imageUrl))
                  ],
                  selected: item.selected,
                  onSelectChanged: (bool select) {
                    setState(() {
                      item.selected = !item.selected;
                    });
                  });
            }).toList(),
          ),
        ])));
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  final _dataSource = PaginatedDelegate();

  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('PaintedDemo'),
              rowsPerPage: 5,
              columns: [
                DataColumn(
                    label: Container(
                      child: Text('Title'),
                      width: 40,
                    ),
                    onSort: (int columnIndex, bool isAscending) {
                      _dataSource._sort((post) {
                        return post.title.length;
                      }, true);
                    }),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('Image')),
              ],
              source: _dataSource,
            ),
          ],
        ),
      ),
    );
  }
}

class PaginatedDelegate extends DataTableSource {
  int _selectedRow = 0;
  final List<Post> _posts = posts;

  @override
  DataRow getRow(int index) {
    Post data = posts[index];

    return DataRow(cells: [
      DataCell(Text(data.title)),
      DataCell(Text(data.author)),
      DataCell(Image.network(data.imageUrl)),
    ]);
  }

  @override
  int get rowCount => posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedRow;

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: posts.map((item) {
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(

                        child: Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),

                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.imageUrl),
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      item.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                            onPressed: null, child: Text('Like'.toUpperCase()))
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
