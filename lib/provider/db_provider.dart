import 'dart:io';

import 'package:ingapirca_app/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentDirecotry = await getApplicationDocumentsDirectory();
    String path = join(documentDirecotry.path, 'ups.db');
    return await openDatabase(path, version: 214, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE user ('
          'id     VARCHAR(200)'
          ',estado       INTEGER'
          ');');

      await db.execute('CREATE TABLE perfil ('
          'id     VARCHAR(200)'
          ',title       VARCHAR(200)'
          ',id_users    VARCHAR(200)'
          ');');
    });
  }
  
  
      Future<List<User>> getAllUser() async {
    final db = await database;
    final resp = await db.query('user');
    List<User> recupera =
        resp.isNotEmpty ? resp.map((c) => User.fromJson(c)).toList() : [];
    return recupera;
  }
    newUser(User user) async {
    final db = await database;
    final res = await db.insert('user', user.toJson());
    return res;
  } 
  
/* 
  nuevoProducto(Producto producto) async {
    final db = await database;
    final res = await db.insert('producto', producto.toJson());
    return res;
  } 







    Future<List<Venta>> getAllVenta() async {
    final db = await database;
    final resp = await db.query('venta');
    List<Venta> recupera =
        resp.isNotEmpty ? resp.map((c) => Venta.fromJson(c)).toList() : [];
    return recupera;
  }
*/
}
