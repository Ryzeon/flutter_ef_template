
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'heroes_app.db';
  final String tableName = 'heroes';

  Database? _database;

  Future<Database> openDb() async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: version,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName (id TEXT PRIMARY KEY, name TEXT, gender TEXT, intelligence TEXT, image TEXT)',
        );
      },
    );
    return _database as Database;
  }
}