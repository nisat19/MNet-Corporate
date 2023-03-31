import 'package:permission_handler/permission_handler.dart';
class PermissionHandler {
  Future<bool> requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    bool ispass = true;
    statuses.forEach((key, value) {
      if (value.isDenied) {
        ispass = false;
      } else if (value.isPermanentlyDenied) {
        ispass = false;
        openAppSettings();
      }
    });
    return ispass;
  }
   
}
