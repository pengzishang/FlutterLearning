import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpDemo extends StatelessWidget {
  Future<List<PostModel>> fetch() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    final postConverted = json.decode(response.body);
    final List posts = postConverted['posts']
        .map<PostModel>((item) => PostModel.fromJson(item))
        .toList();
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
      ),
      body: HttpDemoHome(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            fetch().then((value) {
              value.forEach((value) {
                debugPrint(value.id.toString());
              });
            });
          }),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  Future<List<PostModel>> fetch() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    final postConverted = json.decode(response.body);
    final List posts = postConverted['posts']
        .map<PostModel>((item) => PostModel.fromJson(item))
        .toList();
    return posts;
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetch(),
        builder: (context, snapData) {
          if (snapData.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('loading...'),
            );
          } else if (snapData.connectionState == ConnectionState.done) {
            return ListView(
              children: snapData.data.map<Widget>((PostModel item){
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.author),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.imageUrl),
                  ),
                );

              }).toList(),
            );
          }
        });
  }
}

class PostModel {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  PostModel.fromJson(Map data)
      : id = (data['id']),
        title = data['title'],
        description = data['description'],
        author = data['author'],
        imageUrl = data['imageUrl'];
}
