import 'package:basic_form/src/blocs/form_one_blocs.dart';
import 'package:basic_form/src/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormOne extends StatefulWidget {

  static const String formRoute = 'formRoute';

  @override
  FormOneState createState() => FormOneState();

}

class FormOneState extends State<FormOne> {

  FormOneBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Provider.of<FormOneBloc>(context, listen: false);
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

  Widget buildInput() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 180,
          child: const Center(
            child: Text('Add Image'),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200]
          ),
        )
      ],
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

        },
      )
    );
  }

}