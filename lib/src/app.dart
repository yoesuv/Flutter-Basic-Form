import 'package:basic_form/src/screens/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Form',
      theme: ThemeData(
        primaryColor: Colors.pink
      ),
      home: Home()
    );
  }

}