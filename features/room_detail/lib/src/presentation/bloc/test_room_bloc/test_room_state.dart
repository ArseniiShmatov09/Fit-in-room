part of 'test_room_bloc.dart';

enum TestRoomStatus { initial, loading, passed, notPassed, inputError }

class TestRoomState {
  final TestRoomStatus status;
  final String errorMessage;
  final TestHistoryModel? testHistoryModel;

  const TestRoomState({
    this.status = TestRoomStatus.initial,
    this.errorMessage = '',
    this.testHistoryModel,
  });

  TestRoomState copyWith({
    TestRoomStatus? status,
    String? errorMessage,
    TestHistoryModel? testHistoryModel,
  }) {
    return TestRoomState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      testHistoryModel: testHistoryModel ?? this.testHistoryModel,
    );
  }
}
