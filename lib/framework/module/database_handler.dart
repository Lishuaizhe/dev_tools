import 'dart:async';

import 'package:sqflite/sqflite.dart';

abstract class DatabaseHandler {
  DatabaseHandler(this.dbVer);

  /// 当前模块的数据库版本，添加新表，修改表结构需要增加版本号
  final int? dbVer;

  /// 模块数据第一次创建
  FutureOr<bool> onDatabaseCreate(Transaction db);

  /// 模块数据升级
  FutureOr<bool> onDatabaseUpgrade(Transaction db, int oldVer, int newVer);

}