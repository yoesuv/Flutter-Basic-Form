import 'dart:io';
import 'package:rxdart/rxdart.dart';
import 'package:permission_handler/permission_handler.dart';

class FormOneBloc {

  final PublishSubject<PermissionStatus> _resultRequestStoragePermission = PublishSubject<PermissionStatus>();
  final BehaviorSubject<String> _name = BehaviorSubject<String>.seeded('');

  Stream<PermissionStatus> get streamRequestStoragePermission => _resultRequestStoragePermission.stream;
  Stream<String> get streamName => _name.stream;

  Function(String) get name => _name.sink.add;

  Future<bool> checkStoragePermission() async{
    final PermissionStatus check = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    return check == PermissionStatus.granted;
  }

  Future<void> requestStoragePermission() async{
    final Map<PermissionGroup, PermissionStatus> requestStoragePermission = await PermissionHandler().requestPermissions(<PermissionGroup>[PermissionGroup.storage]);
    _resultRequestStoragePermission.sink.add(requestStoragePermission[PermissionGroup.storage]);
  }

  void sendData(List<File> listImage) {
    print('===== FormOneBloc # Send Data =====');
    print('FormOneBloc # list image size : ${listImage.length}');
    for (final File file in listImage ) {
      if (file!=null) {
        print('FormOneBloc # image ${file.path}');
      }
    }
    print('FormOneBloc # name : ${_name.value}');
  }

  void dispose() {
    _resultRequestStoragePermission.close();
  }

}