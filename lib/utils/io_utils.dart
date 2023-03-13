import 'dart:io';

import 'package:graphs/utils/logger.dart';

abstract class IOUtils {
  static final String dir = "inputs/";

  static String getFileContents({required String fileName}) {
    assert(fileName.isNotEmpty);

    final file = File("$dir$fileName");
    var contents = "";

    // Read the contents of the file
    try {
      contents = file.readAsStringSync();
      Logger.logMsg(contents);
    } on Exception catch (e) {
      contents = "";
      Logger.logError(e);
    }
    return contents;
  }
}
