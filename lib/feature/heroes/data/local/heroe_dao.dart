import 'package:flutter_ef_template/feature/heroes/domain/heroe.dart';
import 'package:flutter_ef_template/shared/data/local/app_database.dart';

class HeroeDao {
  
  Future<List<Heroe>> getAll() async {
    final db = await AppDatabase().openDb();
    List result = await db.query(AppDatabase().tableName);
    return result.map((e) => Heroe.fromMap(e)).toList();
  }

  Future<void> insertFavorite(Heroe heroe) async {
    final db = await AppDatabase().openDb();
    await db.insert(AppDatabase().tableName, heroe.toMap());
  }

  Future<void> deleteFavorite(String id) async {
    final db = await AppDatabase().openDb();
    await db.delete(AppDatabase().tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isFavorite(String id) async {
    final db = await AppDatabase().openDb();
    List result = await db
        .query(AppDatabase().tableName, where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty;
  }
}
