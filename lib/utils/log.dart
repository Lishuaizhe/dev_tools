
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
  wtf,
  nothing,
}

const String _saveLogOpenKey = 'log_cache_open_key';
const String _saveLogLevelKey = 'log_cache_level_key';
const int _logMaxSize = 1024 * 1024 * 50;


class LogFileManager {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool isOpen() {
    return _prefs.getBool(_saveLogOpenKey) ?? false;
  }

  static void setOpen(bool open) {
    _prefs.setBool(_saveLogOpenKey, open);
  }

  static LogLevel getLevel() {
    LogLevel defaultLevel = LogLevel.warning;
    if (kDebugMode) {
      defaultLevel = LogLevel.verbose;
    }

    final int saveLevel = _prefs.getInt(_saveLogLevelKey) ?? defaultLevel.index;
    if (saveLevel >= Level.values.length) {
      return LogLevel.warning;
    }

    return LogLevel.values[saveLevel];
  }

  static void saveLevel(LogLevel logLevel) {
    _prefs.setInt(_saveLogLevelKey, logLevel.index);
  }

  static Future<File> getLogFile() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final String logDirPath = '${appDocumentsDir.path}/logs';
    final logDir = Directory(logDirPath);

    try {
      if (!logDir.existsSync()) {
        logDir.createSync(recursive: true);
      }
    } catch (e) {
      logDir.createSync(recursive: true);
    }

    final String logPath = genFilePath(
      appDocumentsDir.path,
    );
    File currentFile = File(logPath);

    int fileSize = 0;
    try {
      fileSize = await currentFile.length();
    } catch (_) {}
    if (fileSize > _logMaxSize) {
      final backupPath = genFilePath(
        appDocumentsDir.path,
        subNum: '1',
      );
      final File backupFile = File(backupPath);
      final now = DateTime.now();
      try {
        if (backupFile.lastModifiedSync().isBefore(now)) {
          await backupFile.delete();
        }
      } catch (_) {}

      await currentFile.rename(backupPath);

      currentFile = File(logPath);
    }

    return currentFile;
  }

  static bool fileExist(String filePath) {
    final File backupFile = File(filePath);
    final now = DateTime.now();
    try {
      if (backupFile.lastModifiedSync().isBefore(now)) {
        return true;
      }
    } catch (_) {}

    return false;
  }

  static String genFilePath(String dir, {String? subNum}) {
    return '$dir/logs/novo-care${subNum != null ? '.$subNum' : ''}.log';
  }

  static Future<List<String>> getLogFilePathList() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final String logFile = genFilePath(
      appDocumentsDir.path,
      subNum: 'cp',
    );
    final String logFile1 = genFilePath(
      appDocumentsDir.path,
      subNum: '1',
    );

    final List<String> ret = [];
    if (fileExist(logFile)) {
      ret.add(logFile);
    }
    if (fileExist(logFile1)) {
      ret.add(logFile1);
    }

    return ret;
  }

  static Future<void> copyCurLog() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final String logFile = genFilePath(
      appDocumentsDir.path,
    );
    final String logFile1 = genFilePath(
      appDocumentsDir.path,
      subNum: 'cp',
    );
    final File cpFile = File(logFile1);
    if (cpFile.existsSync()) {
      cpFile.delete();
    }

    final File curLog = File(logFile);

    final IOSink cpFileSink = cpFile.openWrite(
      mode: FileMode.writeOnly,
    );

    final stream1 = curLog.openRead();
    await stream1.pipe(cpFileSink);
    await cpFileSink.flush();
    await cpFileSink.close();
  }

  static Future<void> clearLog() async {
    final List<String> logs = await getLogFilePathList();

    for (final String log in logs) {
      try {
        File(log).deleteSync();
      } catch (_) {}
    }
  }
}


class Log {
  static Logger? _logger;

  static Future<void> init() async {
    await LogFileManager.init();

    setLevel(LogFileManager.getLevel());

    _switchLogger(LogFileManager.isOpen());
  }

  static void setLevel(LogLevel logLevel) {
    Level level = Level.warning;
    if (logLevel.index < Level.values.length) {
      level = Level.values[logLevel.index];
    }

    Logger.level = level;

    LogFileManager.saveLevel(logLevel);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.d(message, error: error, stackTrace: stackTrace);
  }

  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.v(message, error: error, stackTrace: stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.i(message, error: error, stackTrace: stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.w(message, error: error, stackTrace: stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.e(message, error: error, stackTrace: stackTrace);
  }

  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.wtf(message, error: error, stackTrace: stackTrace);
  }

  static Future<void> enableFileLog(bool enable) async {
    final bool oldStatus = LogFileManager.isOpen();
    if (enable == oldStatus) {
      return;
    }

    _switchLogger(enable);
    LogFileManager.setOpen(enable);
  }

  static Future<void> _switchLogger(bool enable) async {
    _logger?.close();

    if (!enable) {
      _logger = Logger(
        printer: SimplePrinter(printTime: true, colors: false),
        output: MultiOutput([
          ConsoleOutput(),
        ]),
        filter: ProductionFilter(),
      );
    } else {
      final File file = await LogFileManager.getLogFile();
      _logger = Logger(
        printer: SimplePrinter(printTime: true, colors: false),
        output: MultiOutput([
          ConsoleOutput(),
          if (file != null) FileOutput(file: file),
        ]),

        filter: ProductionFilter(),
      );
    }
  }

  static Future<List<String>> getLogFilePathList() {
    return LogFileManager.getLogFilePathList();
  }

  static Future<void> copyCurLog() {
    return LogFileManager.copyCurLog();
  }
}
