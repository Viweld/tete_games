import 'dart:io';
import 'dart:typed_data';

import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

abstract class FileService {
  static Future<String> saveTempFile({required String name, required Uint8List bytes}) async {
    final Directory tempDir = await getTemporaryDirectory();
    final File file = File('${tempDir.path}/$name');
    await file.writeAsBytes(bytes);
    return file.path;
  }

  static Future<void> openFile(String path) async {
    await OpenFilex.open(path);
  }
}
