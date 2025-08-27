import 'package:fpdart/fpdart.dart';
import 'package:learn_flutter/features/auth/model/auth_token.dart';
import 'package:learn_flutter/features/auth/repos/auth_local_repo.dart';
import 'package:learn_flutter/features/auth/repos/auth_remote_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

late AuthRemoteRepo _authremoterepo;
final _authlocalrepo = AuthLocalRepo();

@riverpod
class AuthViewmodel extends _$AuthViewmodel {
  @override
  FutureOr<AuthToken?> build() {
    _authremoterepo = AuthRemoteRepo();

    return null;
  }

  Future<void> signUpUser({
    required String password,
    required String email,
  }) async {
    state = const AsyncValue.loading();

    final res = await _authremoterepo.signUp(email: email, password: password);

    state = switch (res) {
      Left(value: final l) => AsyncValue.error(l.message, StackTrace.current),
      Right(value: final r) => AsyncValue.data(r),
    };
  }

  Future<void> LogInUser({
    required String password,
    required String email,
  }) async {
    state = const AsyncValue.loading();

    final res = await _authremoterepo.login(email: email, password: password);

    state = switch (res) {
      Left(value: final l) => AsyncValue.error(l.message, StackTrace.current),
      Right(value: final r) => AsyncValue.data(r),
    };
  }
}
