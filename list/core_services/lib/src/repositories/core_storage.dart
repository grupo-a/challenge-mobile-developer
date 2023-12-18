import 'dart:developer' as develop;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core_storage_interface.dart';


const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
  aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  )
);

class CoreStorage implements CoreStorageInterface {
  CoreStorage._();

  static final _instance = CoreStorage._();
  factory CoreStorage() => _instance;
  static const String keyAccess = 'access';
  static const String keyLanguage = 'language';

  @override
  Future<String?> getToken() async {
    return await _getKey(keyAccess);
  }

  @override
  Future<void> saveToken(String token) async {
    return await _saveKey(keyAccess, token);
  }

  @override
  Future<bool> deleteToken() async {
    return await _deleteKey(keyAccess);
  }

  @override
  Future<int?> getLanguage() async {
    var value = await _getKey(keyLanguage);
    return int.tryParse(value ?? '');
  }

  @override
  Future<void> saveLanguage(int language) async {
    return await _saveKey(keyLanguage, language.toString());
  }

  @override
  Future<bool> deleteLanguage() async {
    return await _deleteKey(keyLanguage);
  }

  ///////////////////////////

  Future<String?> _getKey(String key) async {
    try {
      final token = await _secureStorage.read(key: key);

      return token;
    } catch (e, s) {
      develop.log('falha ao buscar', error: e, stackTrace: s);
      throw Exception('falha ao buscar token');
    }
  }

  Future<void> _saveKey(String key, String value) async {
    try {
      final existToken = await _secureStorage.containsKey(key: key);
      if (!existToken) {
        await _secureStorage.write(key: key, value: value);
      } else {
        await _deleteKey(key);
        await _secureStorage.write(key: key, value: value);
      }
    } catch (e, s) {
      develop.log('falha ao salvar', error: e, stackTrace: s);
      throw Exception('Falha ao salar token');
    }
  }

  Future<bool> _deleteKey(String key) async {
    try {
      final existToken = await _secureStorage.containsKey(key: key);
      if (existToken) {
        await _secureStorage.delete(key: key);
      }
      return true;
    } catch (e, s) {
      develop.log('Falha ao deletar', error: e, stackTrace: s);
      return false;
    }
  }

  @override
  Future<void> save({required String key, required String value}) async {
    try {
      final existToken = await _secureStorage.containsKey(key: key);
      if (!existToken) {
        await _secureStorage.write(key: key, value: value);
      } else {
        await _deleteKey(key);
        await _secureStorage.write(key: key, value: value);
      }
    } catch (e, s) {
      develop.log('falha ao salvar', error: e, stackTrace: s);
      throw Exception('Falha ao salvar $key');
    }
  }

  @override
  Future<String?> get({required String key}) {
    try {
      return _getKey(key);
    } catch (e, s) {
      develop.log('Falha ao buscar $key', error: e, stackTrace: s);
      return Future.value(null);
    }
  }

  @override
  Future<bool> delete(String key) {
    try {
      return _deleteKey(key);
    } catch (e, s) {
      develop.log('Falha ao deletar $key', error: e, stackTrace: s);
      return Future.value(false);
    }
  }
}
