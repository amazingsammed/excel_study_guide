import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as ffi;

/// Owns the SQLite connection used to persist user data (bookmarks).
///
/// On Android and iOS the native `sqflite` implementation is used. On Windows
/// and Linux the FFI implementation is enabled instead, since those platforms
/// have no native plugin.
class AppDatabase {
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static const String _fileName = 'excel_study_guide.db';
  static const int _version = 1;

  Database? _database;

  Future<Database> get database async => _database ??= await _open();

  static void initFactory() {
    if (kIsWeb) {
      return;
    }
    if (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux) {
      ffi.sqfliteFfiInit();
      databaseFactory = ffi.databaseFactoryFfi;
    }
  }

  Future<Database> _open() async {
    final path = p.join(await getDatabasesPath(), _fileName);
    return openDatabase(
      path,
      version: _version,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE bookmarks (
            topic_id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            category TEXT NOT NULL,
            file TEXT NOT NULL,
            created_at INTEGER NOT NULL
          )
        ''');
      },
    );
  }
}
