import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:tareas_app/src/models/homework_model.dart';

class DatabaseHelper {
  static final _nameDB = 'School';
  static final _versionDB = 1;
  static final _homeworkTB = 'homework';

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory carpeta = await getApplicationDocumentsDirectory();
    String rutaBD = join(carpeta.path, _nameDB);
    return openDatabase(rutaBD, version: _versionDB, onCreate: _createHW);
  }

  _createHW(Database db, int version) async {
    await db.execute(
        '''Create Table $_homeworkTB ( idHW INTEGER PRIMARY KEY, nameHW TEXT, descriptionHW TEXT,
          deliverDate TEXT, delivered INTEGER)''');
  }

  Future insert(Map<String, dynamic> row) async {
    var conexion = await database;
     conexion!.insert(_homeworkTB, row);    
  }

  Future update(Map<String, dynamic> row) async {
    var conexion = await database;
    var tez =  await conexion!.update(_homeworkTB, row, where: 'idHW = ?', whereArgs: [row['idHW']]);
    print(tez);
  }
  Future updateDeliver(int id, int flag) async {
    var conexion = await database;    
    var tez;
    tez =  await conexion!.rawUpdate('''
    UPDATE $_homeworkTB SET delivered = $flag WHERE idHW = $id''');     
    return tez;
  }

  Future delete(int id) async {
    var conexion = await database;    
    return await conexion!.delete(_homeworkTB, where: 'idHW = ?', whereArgs: [id]);
  }

  Future<List<HomeworkModel>> getAllHW() async {
    var conexion = await database;
    var result = await conexion!.query(_homeworkTB);
    return result.map( ( homeWMap ) => HomeworkModel.fromMap( homeWMap )).toList();
  }

  Future<List<HomeworkModel>> getHommeworkDelivered() async {
    var conexion = await database;
    var result = await conexion!.rawQuery(
      ''' SELECT * FROM $_homeworkTB WHERE delivered = 1''');
    return result.map( ( homeWMap ) => HomeworkModel.fromMap( homeWMap )).toList();
  }

  Future<List<HomeworkModel>> getHommeworkUndeliver() async {
    var conexion = await database;
    var result = await conexion!.rawQuery(
      ''' SELECT * FROM $_homeworkTB WHERE delivered = 0''');
    return result.map( ( homeWMap ) => HomeworkModel.fromMap( homeWMap )).toList();
  }
  
}
