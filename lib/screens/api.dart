import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seekho/model/cmodel.dart';

class api extends StatefulWidget {
  @override
  _apiState createState() => _apiState();
}

class _apiState extends State<api> {
  List<Cmodel> commentsList = [];
  Future<List<Cmodel>> getCapi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        commentsList.add(Cmodel.fromJson(i));
      }
      return commentsList;
    } else {
      commentsList;
    }
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
              future: getCapi(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Text('Loadding');
                } else
                  return ListView.builder(
                    itemCount: commentsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(commentsList[index].id.toString()),
                            Text(commentsList[index].name.toString()),
                            Text(commentsList[index].email.toString()),
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
