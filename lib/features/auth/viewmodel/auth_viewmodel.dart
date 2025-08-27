import 'package:fpdart/fpdart.dart';
import 'package:learn_flutter/features/auth/model/auth_token.dart';
import 'package:learn_flutter/features/auth/repos/auth_remote_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

final _authremoterepo = AuthRemoteRepo();

@riverpod
class AuthViewmodel extends _$AuthViewmodel {
  @override
  AsyncValue<AuthToken?> build() {
    final authToken = null;

    return authToken;
  }

  Future<void> signUpUser({
    required String password,
    required String email,
  }) async {
    final res = await _authremoterepo.signUp(email: email, password: password);

    final val = switch (res) {
      Left(value: final l) => l,
      Right(value: final r) => r,
    };

    print(val.toString());
  }
}
