part of 'authentication_bloc.dart';

abstract class AuthEvent{
  List<Object?> get props => <Object?>[];
}

class SignUpRequestedEvent extends AuthEvent {
  final UserModel user;

  SignUpRequestedEvent(this.user);

  @override
  List<Object?> get props => <Object?>[user];
}

class SignInRequestedEvent extends AuthEvent {
  final UserModel user;

  SignInRequestedEvent(this.user);

  @override
  List<Object?> get props => <Object?>[user];
}

class LogoutRequestedEvent extends AuthEvent {
  final UserModel user;

  LogoutRequestedEvent(this.user);

  @override
  List<Object?> get props => <Object?>[user];
}
