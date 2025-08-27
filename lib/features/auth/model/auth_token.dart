// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthToken {
  final String token;
  final String message;

  const AuthToken({required this.token, required this.message});

  AuthToken copyWith({String? token, String? message}) {
    return AuthToken(
      token: token ?? this.token,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'token': token, 'message': message};
  }

  factory AuthToken.fromMap(Map<String, dynamic> map) {
    return AuthToken(
      token: map['token'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthToken.fromJson(String source) =>
      AuthToken.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthToken(token: $token, message: $message)';

  @override
  bool operator ==(covariant AuthToken other) {
    if (identical(this, other)) return true;

    return other.token == token && other.message == message;
  }

  @override
  int get hashCode => token.hashCode ^ message.hashCode;
}
