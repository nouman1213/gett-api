import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SelfModel extends StatefulWidget {
  @override
  _SelfModelState createState() => _SelfModelState();
}

class _SelfModelState extends State<SelfModel> {
  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photo = Photos(title: i['title'], url: i['url']);
        photosList.add(photo);
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotos(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Photos>> snapshot) {
                return ListView.builder(
                  itemCount: photosList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(snapshot.data[index].title.toString()),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data[index].url.toString()),
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  Photos({this.title, this.url});
}
