import 'package:basic_form/src/screens/home.dart';
import 'package:basic_form/src/screens/form_one.dart';
import 'package:flutter/material.dart';

class AppRoutes {

  static Route<dynamic> routes(RouteSettings settings) {

    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return Home();
          }
        );
        break;
      case FormOne.formRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) {
              return FormOne();
            }
        );
        break;
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) {
              return Home();
            }
        );
        break;
    }

  }

}