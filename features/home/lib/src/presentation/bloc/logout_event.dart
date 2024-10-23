part of 'logout_bloc.dart';

abstract class LogoutEvent {
  List<Object?> get props => <Object?>[];
}

class LogoutRequestedEvent extends LogoutEvent {
  final UserModel user;

  LogoutRequestedEvent(this.user);

  @override
  List<Object?> get props => <Object?>[user];
}
