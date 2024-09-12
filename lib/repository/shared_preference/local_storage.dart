import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey {
  notification,
}

extension StorageKeyValue on StorageKey {
  String get value {
    if (this == StorageKey.notification) {
      return 'notification';
    }
    return '';
  }
}

class LocalStorage {
  final SharedPreferences _prefs;

  LocalStorage(this._prefs);

  Future<String?> get(StorageKey key) async {
    return _prefs.getString(key.value);
  }

  void set(StorageKey key, String value) async {
    await _prefs.setString(key.value, value);
  }

  void remove(StorageKey key) async {
    _prefs.remove(key.value);
  }
}
