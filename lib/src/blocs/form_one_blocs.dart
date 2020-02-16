import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

class FormOneBloc {

  final PublishSubject<PermissionStatus> _resultRequestStoragePermission = PublishSubject<PermissionStatus>();

  Stream<PermissionStatus> get streamRequestStoragePermission => _resultRequestStoragePermission.stream;

  Future<bool> checkStoragePermission() async{
    final PermissionStatus check = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    return check == PermissionStatus.granted;
  }

  Future<void> requestStoragePermission() async{
    final Map<PermissionGroup, PermissionStatus> requestStoragePermission = await PermissionHandler().requestPermissions(<PermissionGroup>[PermissionGroup.storage]);
    _resultRequestStoragePermission.sink.add(requestStoragePermission[PermissionGroup.storage]);
  }

}