import 'package:flutter/material.dart';
import 'package:basic_form/src/routes/app_routes.dart';
import 'package:basic_form/src/providers/app_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: listProvider,
      child: MaterialApp(
        title: 'Basic Form',
        theme: ThemeData(
            primaryColor: Colors.pink
        ),
        onGenerateRoute: AppRoutes.routes,
      )
    );
  }

}