import 'package:fpdart/fpdart.dart';
import 'package:learn_flutter/core/failure/app_fail.dart';
import 'package:learn_flutter/features/auth/model/auth_token.dart';
import 'package:learn_flutter/features/auth/repos/auth_local_repo.dart';
import 'package:learn_flutter/features/auth/repos/auth_remote_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewmodel extends _$AuthViewmodel {
  @override
  FutureOr<AuthToken?> build() {
    return null;
  }

  AsyncValue<AuthToken?> _loginSuccess(
    AuthToken auth,
    AuthLocalRepo authLocalRepo,
  ) {
    print(auth.token);
    authLocalRepo.setToken(auth.token);
    return state = AsyncValue.data(auth);
  }

  Future<void> signUpUser({
    required String password,
    required String email,
  }) async {
    state = const AsyncValue.loading();

    final authRemoteRepo = ref.watch(authremoterepoProvider);
    final authLocalRepo = ref.watch(authlocalrepoProvider);

    final res = await authRemoteRepo.signUp(email: email, password: password);

    state = switch (res) {
      Left(value: final l) => AsyncValue.error(l.message, StackTrace.current),
      Right(value: final r) => _loginSuccess(r, authLocalRepo),
    };
  }

  Future<void> logInUser({
    required String password,
    required String email,
  }) async {
    state = const AsyncValue.loading();

    final authRemoteRepo = ref.watch(authremoterepoProvider);
    final authLocalRepo = ref.watch(authlocalrepoProvider);

    final res = await authRemoteRepo.login(email: email, password: password);

    state = switch (res) {
      Left(value: final l) => AsyncValue.error(l.message, StackTrace.current),
      Right(value: final r) => _loginSuccess(r, authLocalRepo),
    };
  }

  /// Returns AuthToken if verified, or null
  Future<AuthToken?> verify() async {
    print('verify() function ran');
    state = const AsyncValue.loading();

    final authLocalRepo = ref.watch(authlocalrepoProvider);
    final authRemoteRepo = ref.watch(authremoterepoProvider);

    final String? token = authLocalRepo.getToken();
    print("Auth token is $token");

    if (token != null) {
      final res = await authRemoteRepo.verify(token: token);
      state = switch (res) {
        Left(value: final l) => AsyncValue.error(l.message, StackTrace.current),
        Right(value: final r) => _loginSuccess(r, authLocalRepo),
      };
    } else {
      state = AsyncValue.error(
        AppFail(message: "The token is null"),
        StackTrace.current,
      );
      return null;
    }
    return null;
  }
}
