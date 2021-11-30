import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seekho/model/user_model.dart';

class ComplexApi extends StatefulWidget {
  @override
  _ComplexApiState createState() => _ComplexApiState();
}

class _ComplexApiState extends State<ComplexApi> {
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<UserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          children: [
                            ResueableRow(
                                title: 'Name',
                                value: snapshot.data[index].name.toString()),
                            ResueableRow(
                                title: 'UserName',
                                value:
                                    snapshot.data[index].username.toString()),
                            ResueableRow(
                                title: 'Email',
                                value: snapshot.data[index].email.toString()),
                            ResueableRow(
                                title: 'Adress',
                                value: snapshot.data[index].address.street
                                        .toString() +
                                    " " +
                                    snapshot.data[index].address.city
                                        .toString())
                          ],
                        ),
                      );
                    },
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ResueableRow extends StatelessWidget {
  String title, value;
  ResueableRow({Key key, @required this.title, @required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
