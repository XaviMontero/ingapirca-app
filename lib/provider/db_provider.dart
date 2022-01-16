import 'dart:io';

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
    String path = join(documentDirecotry.path, 'Ucacue4.db');
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
/* 
  nuevoProducto(Producto producto) async {
    final db = await database;
    final res = await db.insert('producto', producto.toJson());
    return res;
  } 

    Future<List<Producto>> getAllProducto() async {
    final db = await database;
    final resp = await db.query('producto');
    List<Producto> recupera =
        resp.isNotEmpty ? resp.map((c) => Producto.fromJson(c)).toList() : [];
    return recupera;
  }



  nuevaVenta(Venta venta) async {
    final db = await database;
    final res = await db.insert('venta', venta.toJson());
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
