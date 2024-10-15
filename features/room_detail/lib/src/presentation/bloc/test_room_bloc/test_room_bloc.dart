import 'package:core/core.dart';

part 'test_room_state.dart';

part 'test_room_event.dart';

class TestRoomBloc extends Bloc<TestRoomEvent, TestRoomState> {
  TestRoomBloc() : super(InitialState()) {
    on<ValidateInputEvent>(_onValidateInput);
    on<RunTestEvent>(_onRunTest);
  }

  void _onValidateInput(ValidateInputEvent event, Emitter<TestRoomState> emit) {
    final int? itemWidth = int.tryParse(event.itemWidth);
    final int? itemLength = int.tryParse(event.itemLength);
    final int? itemHeight = int.tryParse(event.itemHeight);

    if (itemWidth == null ||
        itemLength == null ||
        itemHeight == null ||
        itemWidth == 0 ||
        itemLength == 0 ||
        itemHeight == 0) {
      emit(InputErrorState('Invalid input, please enter correct dimensions.'));
    } else {
      emit(TestInProgressState());
      add(RunTestEvent(
        itemWidth: itemWidth,
        itemLength: itemLength,
        itemHeight: itemHeight,
        roomWidth: event.roomWidth,
        roomLength: event.roomLength,
        roomHeight: event.roomHeight,
      ),);
    }
  }

  Future<void> _onRunTest(
      RunTestEvent event, Emitter<TestRoomState> emit,) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final int maxItemDimension = <int>[
      event.itemWidth,
      event.itemLength,
      event.itemHeight,
    ].reduce((int a, int b) => a > b ? a : b);

    final int minRoomDimension = <int>[
      event.roomWidth,
      event.roomLength,
      event.roomHeight,
    ].reduce((int a, int b) => a < b ? a : b);

    final bool isPassed = maxItemDimension <= minRoomDimension;
    emit(
      TestResultState(isPassed: isPassed),
    );
  }
}
