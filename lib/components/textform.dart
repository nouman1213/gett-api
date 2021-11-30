import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  String hinttext;
  Icon icon;
  TextEditingController eC = TextEditingController();
  TextForm({this.hinttext, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (v) {
          if (!eC.text.contains('@')) {
            return 'please enter valid email';
          }
          return null;
        },
        decoration: InputDecoration(
            prefixIcon: icon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: hinttext),
      ),
    );
  }
}
