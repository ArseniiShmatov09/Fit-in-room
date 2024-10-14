import '../../domain.dart';

class DeleteRoomUseCase implements FutureUseCase<int, void> {
  DeleteRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  void call(int roomId) {
    _roomRepository.deleteRoom(roomId);
  }

  @override
  Future<void> execute(int roomId) async {
    await _roomRepository.deleteRoom(roomId);
  }
}
