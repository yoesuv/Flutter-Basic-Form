import 'dart:io';
import 'package:flutter/material.dart';
import 'package:basic_form/src/blocs/form_one_blocs.dart';
import 'package:basic_form/src/data/constanst.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatelessWidget{

  const InputImage(this.index, this.bloc, this.file, this.callbackPicker(File file), this.callbackRemove(int index));

  final int index;
  final FormOneBloc bloc;
  final File file;
  final dynamic callbackPicker;
  final dynamic callbackRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Container(
          width: imageSize,
          height: imageSize,
          padding: const EdgeInsets.only(top: 8.0, right: 8.0),
          child: myImage(file),
        ),
        removeImage(index)
      ],
    );
  }

  Widget myImage(File file) {
    if (file == null) {
      return Material(
        color: Colors.grey[200],
        child: InkWell(
          child: Center(
            child: Icon(Icons.add)
          ),
          onTap: () {
            bloc.checkStoragePermission().then((bool result) {
              if (result) {
                openGallery();
              } else {
                bloc.requestStoragePermission();
                bloc.streamRequestStoragePermission.listen((PermissionStatus status){
                  if (status == PermissionStatus.granted) {
                    openGallery();
                  } else {

                  }
                });
              }
            });
          },
        )
      );
    } else {
      return Image.file(file, fit: BoxFit.cover);
    }
  }

  Widget removeImage(int index) {
    if (index==0) {
      return Container();
    } else {
      return Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            child: Container(
                width: iconDeleteSize,
                height: iconDeleteSize,
                child: Icon(Icons.close, color: Colors.white, size: 15),
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle
                )
            ),
            onTap: () {
              print('Input Image # delete index $index');
              callbackRemove(index);
            }
          )
      );
    }
  }

  void openGallery() {
    print('Input Image # Open Gallery');
    ImagePicker.pickImage(source: ImageSource.gallery).then((File image){
      callbackPicker(image);
    });
  }

}