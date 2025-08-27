import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalRepo {
  late SharedPreferences _authToken;

  Future<void> init() async {
    _authToken = await SharedPreferences.getInstance();
  }

  void setToken(String? token) {
    if (token != null) {
      _authToken.setString("token", token);
    }
  }

  String? getToken() {
    _authToken.getString("token");
    return null;
  }
}
