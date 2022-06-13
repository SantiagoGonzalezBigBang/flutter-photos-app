import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionService {

  static Future<bool> isPermissionGranted() async {
    if (
      Platform.isIOS && 
      await Permission.storage.request().isGranted && 
      await Permission.photos.request().isGranted 
      ||
      Platform.isAndroid && 
      await Permission.storage.request().isGranted
    ) {
      return true;
    }
    return false;
  }

}