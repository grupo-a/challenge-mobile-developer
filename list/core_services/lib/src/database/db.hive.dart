import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'tables.enum.dart';

class DB {
  static BoxCollection? _collections;

  static final Map<String, CollectionBox<Map<dynamic, dynamic>>?> _boxList = {
    Tables.job.name: null,
    Tables.questionario.name: null
  };

  // static initDB() async {
  //   final directory = await getDatabase();
  //   await Hive.initFlutter(directory.path);
  // }

  static Future<CollectionBox<Map<dynamic, dynamic>>> openBox(
      String tableName) async {
    if (_boxList[tableName] == null) {
      var connection = await DB.getConnection();
      _boxList[tableName] =
          await connection.openBox<Map<dynamic, dynamic>>(tableName);
    }
    return _boxList[tableName] as CollectionBox<Map<dynamic, dynamic>>;
  }

  static Future<BoxCollection> getConnection() async {
    _collections ??= await _openConnection();

    return _collections as BoxCollection;
  }

  static Future<BoxCollection> _openConnection() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    var collections = await BoxCollection.open(
      'List',
      {
        Tables.job.name,
        Tables.localAvaliacao.name,
        Tables.usuario.name,
        Tables.questionario.name,
        Tables.questionarioFotos.name,
        Tables.questionarioRespostas.name,
        Tables.questionarioStatusHistorico.name,
      }, // Names of your boxes
      path: appDocDirectory
          .path, // Path where to store your boxes (Only used in Flutter / Dart IO)
      key: HiveAesCipher([
        16,
        80,
        48,
        136,
        184,
        5,
        176,
        88,
        106,
        17,
        141,
        213,
        118,
        45,
        168,
        6,
        66,
        60,
        96,
        248,
        171,
        226,
        238,
        179,
        226,
        87,
        184,
        133,
        75,
        142,
        174,
        11
      ]), // Key to encrypt your boxes (Only used in Flutter / Dart IO)
    );
    //print(Hive.generateSecureKey());
    return collections;
  }
}
