import '../../domain.dart';

class TestRoomFitUseCase implements UseCase<RoomFitParams, bool> {
  TestRoomFitUseCase({
    required TestRoomFitRepository testRoomFitRepository,
  }) : _testRoomFitRepository = testRoomFitRepository;

  final TestRoomFitRepository _testRoomFitRepository;

  @override
  bool execute(RoomFitParams params) {
    return _testRoomFitRepository.testRoomFit(params);
  }
}
