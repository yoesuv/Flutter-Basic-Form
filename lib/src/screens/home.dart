import 'package:basic_form/src/widgets/my_app_bar.dart';
import 'package:basic_form/src/screens/form_one.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Flutter Basic Form'),
      body: SafeArea(
        child: Center(
          child: RaisedButton(
            child: const Text('Open Form', style: TextStyle(
                fontSize: 16
            )),
            onPressed: () {
              Navigator.pushNamed(context, FormOne.formRoute);
            }
          )
        )
      )
    );
  }

}