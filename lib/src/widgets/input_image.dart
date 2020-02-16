import 'dart:io';
import 'package:flutter/material.dart';
import 'package:basic_form/src/data/constanst.dart';

class InputImage extends StatelessWidget{

  const InputImage(this.file);

  final File file;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      child: file != null ? Image.file(file) : Material(
          color: Colors.grey[100],
          child: InkWell(
            child: Center(
                child: Icon(Icons.add)
            ),
            onTap: () {
              print('open gallery');
              },
          )
      )
    );
  }

}