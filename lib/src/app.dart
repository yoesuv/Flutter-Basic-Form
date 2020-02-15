import 'package:flutter/material.dart';
import 'package:basic_form/src/routes/app_routes.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Form',
      theme: ThemeData(
        primaryColor: Colors.pink
      ),
      onGenerateRoute: AppRoutes.routes,
    );
  }

}