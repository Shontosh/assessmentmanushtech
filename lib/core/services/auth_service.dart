
import 'package:assesmentmanushtech/core/storage/storage_adapter.dart';
import 'package:flutter/material.dart';

class AuthService {
  final StorageAdapter storage;

  AuthService(this.storage);

  static const String _accessTokenKey = 'access_token';

  Future<void> saveAccessToken(String accessToken) async {
    debugPrint("saveAccessToken $accessToken");
    await storage.saveData(key: _accessTokenKey, value: accessToken);
  }

  Future<String> getAccessToken() async {
    return await storage.getData(key: _accessTokenKey,) ?? '';
  }

  Future<void> clearAccessToken() async {
    await storage.deleteData(key: _accessTokenKey);
  }

  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token.isNotEmpty;
  }
}
