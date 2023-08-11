import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Helpers {
  static Future<String> getDownloadPath() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    final path = directory.path;
    return path;
  }

  static Future<bool> checkFileExists(String path) async {
    final file = File(path);
    return await file.exists();
  }

  static Future<void> deleteFile(String path) async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }
}