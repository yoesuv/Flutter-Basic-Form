import 'package:permission_handler/permission_handler.dart';

class FormOneBloc {

  Future<bool> checkStoragePermission() async{
    final PermissionStatus check = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    return check == PermissionStatus.granted;
  }

}