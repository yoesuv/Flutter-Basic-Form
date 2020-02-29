import 'package:basic_form/src/blocs/form_one_blocs.dart';
import 'package:basic_form/src/screens/home.dart';
import 'package:basic_form/src/screens/form_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRoutes {

  static Route<dynamic> routes(RouteSettings settings) {

    switch (settings.name) {
      case '/' :
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) {
            return Home();
          }
        );
        break;
      case FormOne.formRoute:
        final Widget page = Provider<dynamic>(create: (_) => FormOneBloc(), child: FormOne());
        return MaterialPageRoute<dynamic>(
            builder: (_) => page
        );
        break;
      default:
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) {
              return Home();
            }
        );
        break;
    }

  }

}