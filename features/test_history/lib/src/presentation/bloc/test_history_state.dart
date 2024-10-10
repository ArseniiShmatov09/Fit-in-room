part of 'test_history_bloc.dart';

enum TestHistoryStatus { loading, loaded, failure }

class TestHistoryState {
  const TestHistoryState({
    this.status = TestHistoryStatus.loading,
    this.testHistories = const <TestHistoryModel>[],
  });

  final TestHistoryStatus status;
  final List<TestHistoryModel> testHistories;

  TestHistoryState copyWith({
    TestHistoryStatus? status,
    List<TestHistoryModel>? testHistories,
  }) {
    return TestHistoryState(
      status: status ?? this.status,
      testHistories: testHistories ?? this.testHistories,
    );
  }

  List<Object?> get props => <Object>[testHistories, status];
}
