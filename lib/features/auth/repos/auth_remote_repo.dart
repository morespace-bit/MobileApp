import "dart:convert";

import "package:fpdart/fpdart.dart";
import "package:http/http.dart" as http;
import "package:learn_flutter/core/constants/constants.dart";
import "package:learn_flutter/core/failure/app_fail.dart";
import "package:learn_flutter/features/auth/model/auth_token.dart";

class AuthRemoteRepo {
  Future<Either<AppFail, AuthToken>> signUp({
    required String email,
    required String password,
  }) async {
    print("$email $password is the data");
    try {
      final response = await http.post(
        Uri.parse("${Constants.backEndUrl}/api/register"),
        headers: {'Content-type': "application/json"},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final userMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 201) {
        return Left(AppFail(message: userMap['message']));
      }

      return Right(AuthToken.fromMap(userMap));
    } catch (e) {
      return Left(AppFail(message: e.toString()));
    }
  }

  Future<Either<AppFail, AuthToken>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${Constants.backEndUrl}/api/login"),
        headers: {'Content-type': 'application/json'},

        body: jsonEncode({"email": email, "password": password}),
      );
      final userMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        return Left(AppFail(message: userMap['message']));
      }

      return Right(AuthToken.fromMap(userMap));
    } catch (e) {
      return Left(AppFail(message: e.toString()));
    }
  }
}
