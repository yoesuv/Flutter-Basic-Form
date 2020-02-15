import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Basic Form'),
      ),
      body: SafeArea(
        child: Center(
          child: RaisedButton(
            child: Text('Open Form'),
            onPressed: () {

            }
          )
        )
      )
    );
  }

}