import 'dart:io';

import 'package:delivery_app/model/bussiness.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {

  static late Database _database;
  final String _dataBaseName = "DeliveryApp.db";
  AppDataBase._();
  static final AppDataBase db = AppDataBase._();

  // SQL INSTRUCCION
  static final _CREATE_STORES = "CREATE TABLE Stores (id INTEGER PRIMARY KEY, name TEXT, type TEXT, description TEXT, category TEXT, webLink TEXT, address TEXT, ubication TEXT, cellphone INTEGER, phone INTEGER, products, TEXT, logo TEXT, images TEXT)";

  // Database Creation
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  // Initializing Database
  initDB() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, _dataBaseName);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {     
      await db.execute(_CREATE_STORES);     
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      if (oldVersion < newVersion) {
        await db.execute("DROP TABLE IF EXISTS Stores");       
        await db.execute(_CREATE_STORES);
      }
    });

  }

  // Create Bussiness
  insertStore(Bussiness bs) async {
    final db = await database;
    var res = await db.insert("Bussinesses", bs.toJson());   
    return res;
  }

  // Search Bussiness
  Future<List<Bussiness>> selectStores(String query) async {
    final db = await database;
    var res = await db.rawQuery(query);
    List<Bussiness> list = [];
    if (res.isNotEmpty) {
      list = <Bussiness>[];
      List<Map<String, dynamic>> temp = res.toList();
      for (Map<String, dynamic> t in temp) {
        list.add(Bussiness.fromJson(t));
      }
    }
    return list;
  }

}