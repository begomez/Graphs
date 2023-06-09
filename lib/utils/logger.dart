import 'dart:io';

/// Custom message logger
abstract class Logger {
  static void logMsg(String msg) {
    print(msg);
  }

  static void logError(Exception e) {
    stderr.write(e.toString());
    print(e.toString());
  }
}
