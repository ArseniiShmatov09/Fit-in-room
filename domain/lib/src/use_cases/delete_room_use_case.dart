import '../../domain.dart';

class DeleteRoomUseCase implements FutureUseCase<String, void> {
  DeleteRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  @override
  Future<void> execute(String roomId) async {
    await _roomRepository.deleteRoom(roomId);
  }
}
