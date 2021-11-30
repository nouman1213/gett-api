import 'package:flutter/material.dart';
import 'package:seekho/components/appbar.dart';
import 'package:seekho/components/textform.dart';

class MainPage extends StatelessWidget {
  var globalkey = GlobalKey<FormState>();
  TextEditingController eC = TextEditingController();
  TextEditingController eP = TextEditingController();
  TextEditingController ePh = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar('Nouman', Colors.transparent),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: globalkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextForm(
                      hinttext: 'enter email',
                      icon: Icon(Icons.email),
                    ),
                    TextForm(
                      hinttext: 'enter password',
                      icon: Icon(Icons.remove_red_eye),
                    ),
                    TextForm(
                      hinttext: 'enter phone',
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20))),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
