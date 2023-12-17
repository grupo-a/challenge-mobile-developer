import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class I18n {
  I18n(this.filePath);

  final String filePath;

  static List<String> availableLanguages = ['pt'];

  static Locale defaultLocale = const Locale('pt');

  static Iterable<Locale> get supportedLocales =>
      I18n.availableLanguages.map((language) => Locale(language, ''));

  Future<Map<String, Map<String, dynamic>>> initializeI18n() async {
    Map<String, Map<String, dynamic>> values;
    values = {};
    for (var language in availableLanguages) {
      Map<String, dynamic> translation =
          json.decode(await _loadJsonFromAsset(language));
      values[language] = _convertValueToString(translation);
    }
    return values;
  }

  Future<String> _loadJsonFromAsset(language) async {
    try {
      final bundle = _AssetBundle();

      return await bundle.loadString('$filePath$language.json');
    } catch (e) {
      throw Exception(
          'Arquivo de tradução "$language" não encontrado na pasta $filePath');
    }
  }

  Map<String, dynamic> _convertValueToString(obj) {
    var result = <String, dynamic>{};
    obj.forEach((key, value) {
      result[key] = value;
    });
    return result;
  }
}

class _AssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    final data = await load(key);
    return utf8.decode(data.buffer.asUint8List());
  }

  @override
  Future<ByteData> load(String key) async {
    try {
      var _result = rootBundle.load(key);
      return _result;
    } catch (e) {
      print('ERROR');
      rethrow;
    }
  }
}
