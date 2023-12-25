import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class FileHelper {
  static Future<String> base64StringFromFilePath(String path) async {
    File imagefile = File(path);
    Uint8List imagebytes = await imagefile.readAsBytes();
    final base64String = base64.encode(imagebytes);
    return base64String;
  }

  static Future<Uint8List> blobFromFilePath(String path) async {
    File imagefile = File(path);
    Uint8List imagebytes = await imagefile.readAsBytes();
    return imagebytes;
  }
}
