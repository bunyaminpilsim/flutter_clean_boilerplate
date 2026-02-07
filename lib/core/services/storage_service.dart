import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

abstract class StorageService {
  // Auth
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
  Future<void> saveRefreshToken(String token);
  Future<String?> getRefreshToken();

  // User
  Future<void> saveUserId(String userId);
  Future<String?> getUserId();
  Future<void> saveUserData(Map<String, dynamic> userData);
  Future<Map<String, dynamic>?> getUserData();

  // Settings
  Future<void> saveLanguage(String languageCode);
  Future<String> getLanguage();
  Future<void> saveThemeMode(String mode);
  Future<String> getThemeMode();

  // Generic
  Future<void> save(String key, dynamic value);
  Future<T?> get<T>(String key);
  Future<void> remove(String key);
  Future<void> clear();
}

class StorageServiceImpl implements StorageService {
  final SharedPreferences _prefs;

  StorageServiceImpl(this._prefs);

  // Auth
  @override
  Future<void> saveToken(String token) async {
    await _prefs.setString(AppConstants.keyAuthToken, token);
  }

  @override
  Future<String?> getToken() async {
    return _prefs.getString(AppConstants.keyAuthToken);
  }

  @override
  Future<void> deleteToken() async {
    await _prefs.remove(AppConstants.keyAuthToken);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await _prefs.setString(AppConstants.keyRefreshToken, token);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _prefs.getString(AppConstants.keyRefreshToken);
  }

  // User
  @override
  Future<void> saveUserId(String userId) async {
    await _prefs.setString(AppConstants.keyUserId, userId);
  }

  @override
  Future<String?> getUserId() async {
    return _prefs.getString(AppConstants.keyUserId);
  }

  @override
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    final jsonString = json.encode(userData);
    await _prefs.setString('user_data', jsonString);
  }

  @override
  Future<Map<String, dynamic>?> getUserData() async {
    final jsonString = _prefs.getString('user_data');
    if (jsonString != null) {
      return json.decode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  // Settings
  @override
  Future<void> saveLanguage(String languageCode) async {
    await _prefs.setString(AppConstants.keyLanguage, languageCode);
  }

  @override
  Future<String> getLanguage() async {
    return _prefs.getString(AppConstants.keyLanguage) ??
        AppConstants.defaultLanguage;
  }

  @override
  Future<void> saveThemeMode(String mode) async {
    await _prefs.setString(AppConstants.keyThemeMode, mode);
  }

  @override
  Future<String> getThemeMode() async {
    return _prefs.getString(AppConstants.keyThemeMode) ?? 'system';
  }

  // Generic
  @override
  Future<void> save(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported value type');
    }
  }

  @override
  Future<T?> get<T>(String key) async {
    final value = _prefs.get(key);
    return value as T?;
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }
}
