import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageDataSource {
  const StorageDataSource({required this.storage});

  final FlutterSecureStorage storage;

  static const _accessToken = "access_token";
  static const _themeMode = "theme_mode";

  Future<void> saveAccessToken(String accessToken) async {
    await storage.write(key: _accessToken, value: accessToken);
  }

  Future<String> getAccessToken() async {
    final accessToken = await storage.read(key: _accessToken);
    return accessToken ?? "";
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    await storage.write(key: _themeMode, value: themeMode.name);
  }

  Future<ThemeMode> getTheme() async {
    final themeName = await storage.read(key: _themeMode);
    if (themeName == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (themeName == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}
