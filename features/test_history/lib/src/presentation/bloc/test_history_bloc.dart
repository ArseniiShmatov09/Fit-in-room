import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_history_state.dart';

part 'test_history_event.dart';

class TestHistoryBloc extends Bloc<TestHistoryEvent, TestHistoryState> {
  TestHistoryBloc({
    required GetTestHistoriesUseCase getTestHistoriesUseCase,
    required UserModel user,
  })  : _getTestHistoriesUseCase = getTestHistoriesUseCase,
        super(const TestHistoryState()) {
    on<LoadTestHistoryEvent>(_loadTestHistories);
    add(LoadTestHistoryEvent(user: user));
  }

  final GetTestHistoriesUseCase _getTestHistoriesUseCase;

  Future<void> _loadTestHistories(
    LoadTestHistoryEvent event,
    Emitter<TestHistoryState> emit,
  ) async {
    try {
      if (state.status == TestHistoryStatus.loading) {
        emit(
          state.copyWith(
            status: TestHistoryStatus.loading,
          ),
        );
      }

      final List<TestHistoryModel> testHistories =
          await _getTestHistoriesUseCase.execute(
        event.user.username,
      );

      emit(
        state.copyWith(
          testHistories: testHistories,
          status: TestHistoryStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: TestHistoryStatus.failure),
      );
    }
  }
}
