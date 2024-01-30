import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database? database;

  Future<Database> get db async {
    if (database != null) {
      return database!;
    } else {
      database = await createDatabase();
      return database!;
    }
  }

 
  Future<Database> createDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, "demo.db");

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            '''CREATE TABLE FavoriteTable (id INTEGER, name TEXT, symbol TEXT, slug TEXT,  isfav INTEGER)''');
      },
     
    );

    return database;
  }
}
