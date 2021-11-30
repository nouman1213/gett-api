import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seekho/screens/alb.dart';
import 'package:seekho/screens/api.dart';
import 'package:seekho/screens/apipage.dart';
import 'package:http/http.dart' as http;
import 'package:seekho/screens/complex.dart';
import 'package:seekho/selfmodel.dart';

import 'model/post_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepOrange,
      ),
      home: ComplexApi(),
    );
  }
}

class api_page extends StatefulWidget {
  api_page({Key key}) : super(key: key);

  @override
  _api_pageState createState() => _api_pageState();
}

class _api_pageState extends State<api_page> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF873691),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        title: Text(
          'Nouman',
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loadding');
                  } else
                    return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(postList[index].id.toString()),
                              Text(
                                'Title',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(postList[index].title.toString()),
                              Text(
                                'Body',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(postList[index].body.toString()),
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
      ),
    );
  }
}
