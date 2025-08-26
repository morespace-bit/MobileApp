import "dart:convert";

import "package:http/http.dart" as http;

class AuthRemoteRepo {
  Future<void> signUp({required String email, required String password}) async {
    print("$email $password is the data");
    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:4000/api/register"),
        headers: {'Content-type': "application/json"},
        body: jsonEncode({'email': email, 'password': password}),
      );
      print(jsonDecode(response.body));
      print("Response should have been printed");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:4000/api/login"),
        headers: {'Content-type': 'application/json'},

        body: jsonEncode({"email": email, "password": password}),
      );

      print(jsonDecode(response.body));
    } catch (e) {
      print(e.toString());
    }
  }
}
