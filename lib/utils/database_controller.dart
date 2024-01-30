
import 'package:trial_task/Modal/crypto.dart';

import 'database_provider.dart';


class DatabaseController{
  final dbClient = DatabaseProvider.dbProvider;
final favTable = "FavoriteTable";
final cryptoList = "cryptoList";



Future<int> createEntryDB(CryptoCurrenciesData? todo) async {
    final db = await dbClient.db;
      print(todo!.id);
    if (await isIdAvailable(todo.id ?? 0)) {
      int result = await db.insert(favTable, todo.toJson());
    return result;
    }else{
      return -1;
}    
  }


  Future<List<CryptoCurrenciesData>> getAllData(int offset,{List<String>? columns}) async {
    final db = await dbClient.db;
    var result = await db.query(favTable,columns: columns,limit: 20,offset: offset);
        
    List<CryptoCurrenciesData> todos = result.isNotEmpty ? result.map((item) => CryptoCurrenciesData.fromJson(item)).toList() : [];
    return todos;
  }

  Future<List<CryptoCurrenciesData>> getAllFav({List<String>? columns,}) async {
    final db = await dbClient.db;
    var result = await db.query(favTable,columns: columns,);
    var favList = result.where((element) => element["isfav"] == 1).toList();
    List<CryptoCurrenciesData> todos = favList.isNotEmpty ? favList.map((item) => CryptoCurrenciesData.fromJson(item)).toList() : [];
    return todos;
  }

  Future<bool> isIdAvailable(int id) async {
      final db = await dbClient.db;
    final result = await db.query(favTable , where: "id = ?", whereArgs: [id]);
    return result.isEmpty;
  }


  Future<int> updateIsFav(CryptoCurrenciesData? todo) async {
    final db = await dbClient.db;
    var result = await db.update(favTable, todo!.toJson(),where: "id = ?", whereArgs: [todo.id]);
    return result;
  }

Future<Map<String, Object?>> findByID(CryptoCurrenciesData? todo) async {
    final db = await dbClient.db;
    final result = await db.query(favTable , where: "id = ?", whereArgs: [todo!.id]);
    return result.first;
  }

}
