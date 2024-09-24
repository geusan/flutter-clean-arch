import 'package:sqflite/sqflite.dart';

abstract interface class IModelAction<T> {
  Future<T> create(T item) async {
    throw UnimplementedError();
  }

  Future<T> update(T item) async {
    throw UnimplementedError();
  }

  Future<void> delete(T item) async {
    throw UnimplementedError();
  }

  Future<T> findOne(dynamic id) async {
    throw UnimplementedError();
  }

  static Future<void> creatTable() async {
    throw UnimplementedError();
  }
}

abstract interface class TableManager<T> {
  static String tableName = '';
  T fromJson(Map<String, dynamic> map) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson(T item) {
    throw UnimplementedError();
  }

  String createTable() {
    throw UnimplementedError();
  }
}

class DbConfig {
  static Database? _db;
  Future<Database> get getDb => getInstance();

  static Future<Database> getInstance() async {
    _db ??= await openDatabase('sqlite.db', onCreate: (db, version) async {
      // await db.execute(Noti);
    });
    return _db!;
  }
}

class DbConnection {
  DbConfig db = DbConfig();
  String table;
  DbConnection(this.table);

  Future<int> insert(Map<String, Object?> values,
      {String? nullColumnHack, ConflictAlgorithm? conflictAlgorithm}) async {
    return (await db.getDb).insert(table, values,
        nullColumnHack: nullColumnHack, conflictAlgorithm: conflictAlgorithm);
  }

  Future<int> delete({String? where, List<Object?>? whereArgs}) async {
    return (await db.getDb).delete(table, where: where, whereArgs: whereArgs);
  }

  Future<int> update(Map<String, Object?> values,
      {String? where,
      List<Object?>? whereArgs,
      ConflictAlgorithm? conflictAlgorithm}) async {
    return (await db.getDb).update(table, values,
        where: where,
        whereArgs: whereArgs,
        conflictAlgorithm: conflictAlgorithm);
  }

  Future<List<Map<String, Object?>>> query(
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) async {
    return (await db.getDb).query(table,
        columns: columns,
        where: where,
        whereArgs: whereArgs,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset);
  }
}
