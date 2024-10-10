part of 'test_history_bloc.dart';

sealed class TestHistoryEvent {
  const TestHistoryEvent();

  List<Object> get props => <Object>[];
}

class LoadTestHistoryEvent extends TestHistoryEvent {
  const LoadTestHistoryEvent();

  @override
  List<Object> get props => <Object>[];
}
