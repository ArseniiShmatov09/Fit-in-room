part of 'logout_bloc.dart';

class LogoutState {
  const LogoutState({
    this.error,
  });

  final String? error;

  LogoutState copyWith({
    UserModel? user,
    String? error,
  }) {
    return LogoutState(
      error: error ?? this.error,
    );
  }

  List<Object?> get props => <Object?>[error];
}
