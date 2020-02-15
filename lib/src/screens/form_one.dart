import 'package:basic_form/src/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class FormOne extends StatefulWidget {

  static const String formRoute = 'formRoute';

  @override
  FormOneState createState() => FormOneState();

}

class FormOneState extends State<FormOne> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Form Upload'),
      body: SafeArea(
        child: Center(
          child: Text('Input Form'),
        )
      )
    );
  }

}