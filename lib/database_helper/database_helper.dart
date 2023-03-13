import 'package:FdisTesting/models/store_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();

  factory DBHelper() {
    return _instance;
  }

  DBHelper._internal();

  static Database? _database;

  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'my_table';
  static const id= 'id';
  static const auditId = 'auditId';
  static const categoryId = 'categoryId';
  static const category = 'category';
  static const floor = 'floor';
  static const floorId = 'floorId';
  static const area = 'area';
  static const areaId = 'areaId';
  static const areaNumber = 'areaNumber';
  static const telElement = 'telElement';
  static const element = 'element';
  static const elementId = 'elementId';
  static const foutSoort = 'foutSoort';
  static const foutSoortId = 'foutSoortId';
  static const aantal = 'aantal';
  static const logboekImage = 'logboekImage';
  static const logboekText = 'logboekText';
  static const technischeImage = 'technischeImage';
  static const technischeText = 'technischeText';
  static const errorCount = 'errorCount';


  void _createDb(Database db, int version) async {
    debugPrint('enter in _createDB method');
    await db.execute('''
    CREATE TABLE $table (
      $id INTEGER PRIMARY KEY AUTOINCREMENT,
      $auditId TEXT NOT NULL,
      $category TEXT NOT NULL,
      $categoryId TEXT NOT NULL,
      $floor TEXT NOT NULL,
      $floorId TEXT NOT NULL,
      $area TEXT NOT NULL,
      $areaId TEXT NOT NULL,
      $areaNumber TEXT NOT NULL,
      $telElement TEXT NOT NULL,
      $element TEXT NOT NULL,
      $elementId TEXT NOT NULL,
      $foutSoort TEXT NOT NULL,
      $foutSoortId TEXT NOT NULL,
      $aantal TEXT NOT NULL,
      $logboekImage TEXT NOT NULL,
      $logboekText TEXT NOT NULL,
      $technischeImage TEXT NOT NULL,
      $technischeText TEXT NOT NULL,
      $errorCount TEXT NOT NULL
    )
  ''');
  }


  late Database _db;

  Future<void> init() async {
    debugPrint('enter in init method');
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDb,
    );
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // If _database is null, we instantiate it.
    _database = await initDatabase();
    debugPrint('enter in database method');
    return _database!;
  }

  Future<Database> initDatabase() async {
    debugPrint('enter in initDatabase method');
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "MyDatabase.db");

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }


  Future<List<EntryData>> getEntries(
      {required String getCategoryId, required String getFloorId, required String getAreaId, required String getAreaNumber}) async {
    final db = await database;

    final data = await db.rawQuery("select * from $table");

    final List<Map<String, dynamic>> maps = await db.query(table,
        where: '$categoryId = ? AND $floorId = ? AND $areaId = ? AND $areaNumber = ?',
        whereArgs: [getCategoryId, getFloorId, getAreaId, getAreaNumber]);

    return List.generate(maps.length, (i) {
      return EntryData(
        id: maps[i]['id'],
        auditId: maps[i]['auditId'],
        categoryId: maps[i]['categoryId'],
        category: maps[i]['category'],
        floor: maps[i]['floor'],
        floorId: maps[i]['floorId'],
        area: maps[i]['area'],
        areaId: maps[i]['areaId'],
        areaNumber: maps[i]['areaNumber'],
        telElement: maps[i]['telElement'],
        element: maps[i]['element'],
        elementId: maps[i]['elementId'],
        foutSoort: maps[i]['foutSoort'],
        foutSoortId: maps[i]['foutSoortId'],
        aantal: maps[i]['aantal'],
        logboekImage: maps[i]['logboekImage'],
        logboekText: maps[i]['logboekText'],
        technischeImage: maps[i]['technischeImage'],
        technischeText: maps[i]['technischeText'],
        errorCount: maps[i]['count']??"",
      );
    });
  }

  Future<void> insertEntry(List<EntryData> entry) async {
    final db = await database;
    for (var element in entry) {
      await db.insert(table, element.toMap(),
          conflictAlgorithm: ConflictAlgorithm.ignore);
    }
  }

  Future<void> updateEntry(EntryData entry) async {
    final db = await database;
    await db.update('entries', entry.toMap(),
        where: 'id = ?', whereArgs: [entry.id]);
  }

  Future<void> deleteEntry(int id) async {
    final db = await database;
    await db.delete('entries', where: 'id = ?', whereArgs: [id]);
  }
}
