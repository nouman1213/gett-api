import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seekho/model/alb_model.dart';

class Album extends StatefulWidget {
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  List<AlbModel> albList = [];
  Future<List<AlbModel>> getAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        albList.add(AlbModel.fromJson(i));
      }
      return albList;
    } else
      return albList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getAlbum(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Text('Loadding');
                } else
                  return ListView.builder(
                    itemCount: albList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(albList[index].id.toString()),
                            Text(albList[index].userId.toString()),
                            Text(albList[index].title.toString()),
                          ],
                        ),
                      );
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
