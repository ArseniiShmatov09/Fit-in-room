import '../../domain.dart';

class UpdateRoomUseCase {
  UpdateRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  Future<void> call(int oldRoomId, RoomModel newRoom) async {
    await _roomRepository.updateRoom(oldRoomId, newRoom);
  }
}