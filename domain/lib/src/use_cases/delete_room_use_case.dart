import '../../domain.dart';
import 'use_case.dart';

class DeleteRoomUseCase implements UseCase<int, void> {
  DeleteRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  void call(int roomId) {
    _roomRepository.deleteRoom(roomId);
  }

  @override
  void execute(int roomId) {
    _roomRepository.deleteRoom(roomId);
  }
}
