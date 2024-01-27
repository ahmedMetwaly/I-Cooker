import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static Future<Database> createLocalDatabase() async {
    return await openDatabase(
      "favouriteMeals.db",
      version: 1,
      onCreate: (database, version) async {
        await database
            .execute("CREATE TABLE fav (id INTEGER PRIMARY KEY, idMeal TEXT)")
            .then((value) => "database created successfully")
            .catchError((error) => "Error on creating dataBase: $error");
      },
    );
  }

  static Future<List> getFavMealsIdsData(Database db) async {
    return await db.transaction((txn) async => await txn
        .rawQuery("SELECT * FROM fav")
        .then((value) => value.map((favMeal) => favMeal["idMeal"]).toList())
        .catchError((error) => throw "Error on getting data: $error"));
  }

  static Future insertFavMealIdData(Database db, String idMeal) async {
    await db.transaction((txn) async => await txn
        .rawInsert("INSERT INTO fav (idMeal) VALUES(?)", [idMeal])
        .then((value) =>  "$idMeal is added successfully to $value")
        .catchError((error) => throw "Error while insertig data: $error"));
  }

  static Future deleteFavMealIdData(Database db, String idMeal) async {
    await db
        .rawDelete("DELETE FROM fav WHERE idMeal = ?", [idMeal])
        .then((value) => "$idMeal is Deleted successfully")
        .catchError((error) => throw "Error on deleting meal: $error");
  }
}
