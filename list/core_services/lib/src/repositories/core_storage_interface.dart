abstract class CoreStorageInterface {
  Future<String?> getToken();
  Future<void> saveToken(String token);
  Future<bool> deleteToken();

  Future<int?> getLanguage();
  Future<void> saveLanguage(int language);
  Future<bool> deleteLanguage();
  Future<void> save({
    required String key,
    required String value,
  });

  Future<String?> get({
    required String key,
  });
  Future<bool> delete(String key);
}
