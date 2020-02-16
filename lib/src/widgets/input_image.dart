import 'dart:io';
import 'package:flutter/material.dart';
import 'package:basic_form/src/blocs/form_one_blocs.dart';
import 'package:basic_form/src/data/constanst.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatelessWidget{

  //const InputImage(this.bloc, this.file, {void callbackPicker(File file)}): callbackPicker = callbackPicker;
  const InputImage(this.bloc, this.file, this.callbackPicker(File file));

  final FormOneBloc bloc;
  final File file;
  final dynamic callbackPicker;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      child: file != null ? Image.file(file, fit: BoxFit.cover) : Material(
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
            }
          )
      )
    );
  }

  void openGallery() {
    print('Input Image # Open Gallery');
    ImagePicker.pickImage(source: ImageSource.gallery).then((File image){
      callbackPicker(image);
    });
  }

}