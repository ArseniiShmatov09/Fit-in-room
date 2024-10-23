part of 'test_history_bloc.dart';

sealed class TestHistoryEvent {
  const TestHistoryEvent();

  List<Object> get props => <Object>[];
}

class LoadTestHistoryEvent extends TestHistoryEvent {
  final UserModel user;

  const LoadTestHistoryEvent({required this.user});

  @override
  List<Object> get props => <Object>[user];
}
