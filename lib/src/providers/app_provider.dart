import 'package:basic_form/src/blocs/form_one_blocs.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> listProvider = <SingleChildWidget>[
  Provider<FormOneBloc>(create:(_) => FormOneBloc())
];