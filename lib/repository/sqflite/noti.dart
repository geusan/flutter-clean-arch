import 'package:flutter_clean_arch/domain/noti.dart';
import 'package:flutter_clean_arch/repository/sqflite/base.dart';


class NotiTableManager implements TableManager<Noti> {
  static const _columnId = '_id';
  static const _columnContent = 'content';
  static const _columnTimestamp = 'timestamp';

  String tableName = 'notifications';

  @override
  Noti fromJson(Map<String, dynamic> map) {
    return Noti(
      content: map[_columnContent],
      id: map[_columnId],
      timestamp: map[_columnTimestamp],
    );
  }

  @override
  Map<String, dynamic> toJson(Noti item) {
    return {
      _columnId: item.id,
      _columnContent: item.content,
      _columnTimestamp: item.timestamp
    };
  }

  @override
  String createTable() {
    return '''
    create table $tableName (
      $_columnId integer primary key autoincrement,
      $_columnContent text not null,
      $_columnTimestamp integer not null
    )
    ''';
  }
}

class NotiTable implements IModelAction<Noti> {
  final translator = NotiTableManager();
  late DbConnection conn;

  NotiTable() {
    conn = DbConnection(translator.tableName);
  }

  @override
  Future<Noti> create(Noti item) async {
    final id = await conn.insert(item.toJson());
    item.id = id;
    return item;
  }

  @override
  Future<void> delete(Noti item) async {
    await conn.delete(where: 'id = ?', whereArgs: [item.id]);
  }

  Future<Iterable<Noti>> findMany() async {
    final items = await conn.query();
    final notis = items.map((e) => translator.fromJson(e));
    return notis;
  }

  @override
  Future<Noti> findOne(dynamic id) async {
    final items = await conn.query(where: 'id = ?', whereArgs: [id]);
    if (items.isEmpty) {
      throw Exception();
    }
    final item = items[0];
    return translator.fromJson(item);
  }

  @override
  Future<Noti> update(Noti item) async {
    await conn.update(translator.toJson(item));
    return item;
  }
}
