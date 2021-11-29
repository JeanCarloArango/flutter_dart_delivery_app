import 'package:delivery_app/model/bussiness.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDataBase {
  static final AppDataBase instance = AppDataBase._init();
  static Database? _database;
  AppDataBase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb('deliveryApp.db');
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('CREATE TABLE Bussinesses ('
        "id INTEGER PRIMARY KEY,"
        "Name TEXT,"
        "Type TEXT,"
        "Description TEXT,"
        "Category TEXT,"
        "b_linkWeb TEXT,"
        "b_address TEXT,"
        "b_ubication TEXT,"
        "b_celphone INTEGER,"
        "b_phone INTEGER,"
        "b_productos TEXT,"
        "b_logo TEXT,"
        "images TEXT"
        ')');
  }

  Future<String> create(Bussiness bs) async {
    final db = await instance.database;

    final id = db.insert('Bussinesses', bs.toJson());
    return 'Se Creo la tienda';
  }

  Future<List<Bussiness>> selectBussinesses(String query) async {
    final db = await database;
    var res = await db.rawQuery(query);
    List<Bussiness> list = [];

    if (res.isNotEmpty) {
      List<Map<String, dynamic>> temp = res.toList();
      for (Map<String, dynamic> t in temp) {
        list.add(Bussiness.fromJson(t));
      }
    }
    // print(list);
    return list;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
