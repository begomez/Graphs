import 'dart:io';

import 'package:graphs/utils/logger.dart';

/// Wrapper obj. around static methods
class IOWrapper {
  const IOWrapper() : super();

  String getFileContents({required String fileName}) =>
      _IOUtils.getFileContents(fileName: fileName);
}

/// I/O utilities
abstract class _IOUtils {
  static final String dir = "inputs/";

  static String getFileContents({
    required String fileName,
    String preffix = "Graph",
  }) {
    assert(fileName.isNotEmpty);

    final file = File("$dir$fileName");
    var contents = "";

    // Read the contents of the file
    try {
      contents = file.readAsStringSync();
      Logger.logMsg("$preffix:\n$contents");
    } on Exception catch (e) {
      contents = "";
      Logger.logError(e);
    }
    return contents;
  }
}
