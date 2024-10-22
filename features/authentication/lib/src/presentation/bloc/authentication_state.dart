part of 'authentication_bloc.dart';

enum AuthStatus { initial, loading, success, failure, loggedOut }

class AuthState {
  const AuthState({
    this.status = AuthStatus.initial,
    this.token,
    this.error,
  });

  final AuthStatus status;
  final String? token;
  final String? error;

  AuthState copyWith({
    AuthStatus? status,
    String? token,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }

  List<Object?> get props => <Object?>[status, token, error];
}
