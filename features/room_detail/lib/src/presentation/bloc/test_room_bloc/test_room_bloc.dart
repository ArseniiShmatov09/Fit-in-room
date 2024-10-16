import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_room_state.dart';

part 'test_room_event.dart';

class TestRoomBloc extends Bloc<TestRoomEvent, TestRoomState> {
  final AddTestHistoryUseCase _addTestHistoryUseCase;
  final TestRoomFitUseCase _testRoomFitUseCase;

  TestRoomBloc({
    required AddTestHistoryUseCase addTestHistoryUseCase,
    required TestRoomFitUseCase testRoomFitUseCase,
  })  : _addTestHistoryUseCase = addTestHistoryUseCase,
        _testRoomFitUseCase = testRoomFitUseCase,
        super(const TestRoomState()) {
    on<RunTestEvent>(_runTest);
  }

  Future<void> _runTest(
    RunTestEvent event,
    Emitter<TestRoomState> emit,
  ) async {
    if (event.itemWidth <= 0 ||
        event.itemLength <= 0 ||
        event.itemHeight <= 0) {
      emit(
        state.copyWith(
          status: TestRoomStatus.inputError,
          errorMessage: 'All dimensions must be greater than zero.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: TestRoomStatus.loading));

    await Future<void>.delayed(const Duration(seconds: 1));
    final RoomFitParams params = RoomFitParams(
      itemWidth: event.itemWidth,
      itemLength: event.itemLength,
      itemHeight: event.itemHeight,
      roomWidth: event.roomWidth,
      roomLength: event.roomLength,
      roomHeight: event.roomHeight,
    );
    final bool isTestPassed = _testRoomFitUseCase.execute(params);

    final TestHistoryModel testHistoryModel = TestHistoryModel(
      id: event.id,
      itemLength: event.itemLength,
      itemWidth: event.itemWidth,
      itemHeight: event.itemHeight,
      roomName: event.roomName,
      isTestPassed: isTestPassed,
    );

    await _addTestHistoryUseCase.execute(testHistoryModel);

    emit(
      state.copyWith(
        status: isTestPassed ? TestRoomStatus.passed : TestRoomStatus.notPassed,
        testHistoryModel: testHistoryModel,
      ),
    );
  }
}
