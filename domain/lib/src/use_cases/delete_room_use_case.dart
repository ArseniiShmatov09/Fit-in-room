import '../../domain.dart';

class DeleteRoomUseCase {
  DeleteRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  Future<void> call(int roomId) async {
    await _roomRepository.deleteRoom(roomId);
  }
}