import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{

  MyAppBar(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return
      AppBar(
        title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

}