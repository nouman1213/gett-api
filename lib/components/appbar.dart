import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appBar(String title, Color c) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.amber),
    ),
    centerTitle: true,
    backgroundColor: c,
    elevation: 0,
  );
}
