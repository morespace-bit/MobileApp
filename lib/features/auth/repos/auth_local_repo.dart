import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_local_repo.g.dart';

@riverpod
AuthLocalRepo authlocalrepo(Ref ref) {
  return AuthLocalRepo();
}

class AuthLocalRepo {
  SharedPreferences? _prefs; // make nullable

  /// Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save token
  Future<void> setToken(String? token) async {
    if (_prefs == null) await init(); // ensure initialized
    if (token != null && token.isNotEmpty) {
      await _prefs!.setString("token", token);
    } else {
      await _prefs!.remove("token");
    }
  }

  /// Get token
  Future<String?> getToken() async {
    if (_prefs == null) await init(); // ensure initialized
    return _prefs!.getString("token");
  }
}
