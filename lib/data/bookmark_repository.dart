import 'package:sqflite/sqflite.dart';

import '../models/bookmark.dart';
import 'app_database.dart';

abstract class BookmarkRepository {
  Future<List<Bookmark>> getAll();
  Future<void> add(Bookmark bookmark);
  Future<void> remove(String topicId);
  Future<void> clear();
}

/// SQLite-backed implementation used by the running app.
class SqliteBookmarkRepository implements BookmarkRepository {
  static const String _table = 'bookmarks';

  Future<Database> get _db => AppDatabase.instance.database;

  @override
  Future<List<Bookmark>> getAll() async {
    final db = await _db;
    final rows = await db.query(_table, orderBy: 'created_at DESC');
    return rows.map(Bookmark.fromMap).toList(growable: false);
  }

  @override
  Future<void> add(Bookmark bookmark) async {
    final db = await _db;
    await db.insert(
      _table,
      bookmark.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> remove(String topicId) async {
    final db = await _db;
    await db.delete(
      _table,
      where: 'topic_id = ?',
      whereArgs: <Object?>[topicId],
    );
  }

  @override
  Future<void> clear() async {
    final db = await _db;
    await db.delete(_table);
  }
}

/// Lightweight implementation used by tests so they never touch native SQLite.
class InMemoryBookmarkRepository implements BookmarkRepository {
  final List<Bookmark> _items = <Bookmark>[];

  @override
  Future<List<Bookmark>> getAll() async => List<Bookmark>.unmodifiable(_items);

  @override
  Future<void> add(Bookmark bookmark) async {
    _items.removeWhere((item) => item.topicId == bookmark.topicId);
    _items.insert(0, bookmark);
  }

  @override
  Future<void> remove(String topicId) async {
    _items.removeWhere((item) => item.topicId == topicId);
  }

  @override
  Future<void> clear() async {
    _items.clear();
  }
}
