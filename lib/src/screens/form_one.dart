import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:basic_form/src/blocs/form_one_blocs.dart';
import 'package:basic_form/src/widgets/input_image.dart';
import 'package:basic_form/src/widgets/my_app_bar.dart';
import 'package:basic_form/src/data/constanst.dart';

class FormOne extends StatefulWidget {

  static const String formRoute = 'formRoute';

  @override
  FormOneState createState() => FormOneState();

}

class FormOneState extends State<FormOne> {

  FormOneBloc bloc;
  List<File> listImage = <File>[];

  @override
  void initState() {
    super.initState();
    listImage.clear();
    listImage.add(null);
    bloc = FormOneBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Form Upload'),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            buildInput(),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildButtonSave()
            )
          ],
        )
      )
    );
  }

  @override
  void dispose(){
    // bloc.drainBloc();
    bloc.dispose();
    super.dispose();
  }

  Widget buildInput() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        contentTop(),
        const SizedBox(height: 8),
        buildListImage(),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: inputName(),
        )
      ],
    );
  }

  Widget contentTop() {
    return Container(
      width: double.infinity,
      height: 190,
      child: contentImage()
    );
  }

  Widget contentImage() {
    if (listImage.length <= 1) {
      return Material(
        color: Colors.grey[200],
        child: InkWell(
          child: Center(
            child: Text('Add Image', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            )),
          ),
          onTap: () {
            bloc.checkStoragePermission().then((bool result) {
              if (result) {
                bloc.requestStoragePermission();
                bloc.streamRequestStoragePermission.listen((PermissionStatus status){
                  if (status == PermissionStatus.granted) {
                    ImagePicker.pickImage(source: ImageSource.gallery).then((File image){
                      print('Form One # from main image => $image');
                      if (image!=null) {
                        setState(() {
                          listImage.add(image);
                        });
                      }
                    });
                  } else {

                  }
                });
              }
            });
          },
        ),
      );
    } else {
      return Image.file(listImage[1], fit: BoxFit.cover);
    }
  }

  Widget buildListImage() {
    return Container(
        width: double.infinity,
        height: imageSize,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listImage.length,
            itemBuilder: (BuildContext context, int index) {
              final bool isLast = listImage.length == (index+1);
              final double rightPadding = isLast ? 0.0 : 4.0;
              return Container(
                  padding: EdgeInsets.only(right: rightPadding),
                  child: InputImage(index, bloc, listImage[index], (File image) {
                      print('Form One # from item image => file is $image');
                      if (image!=null) {
                        setState(() {
                          listImage.add(image);
                        });
                      }
                    }, (int index) {
                      setState(() {
                        listImage.removeAt(index);
                      });
                    })
              );
            }
        )
    );
  }

  Widget inputName() {
    return StreamBuilder<String>(
      stream: bloc.streamName,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.name,
          style: const TextStyle(
            fontSize: 18.0
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
            hintText: 'Your Name',
            labelText: 'Input Your Name'
          ),
        );
      },
    );
  }

  Widget buildButtonSave() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.green[700],
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))
        ),
        child: const Text('SAVE', style: TextStyle(
            fontSize: 16,
            color: Colors.white
        )),
        onPressed: () {
          bloc.sendData(listImage);
        },
      )
    );
  }

}