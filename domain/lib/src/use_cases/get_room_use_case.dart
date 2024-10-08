import '../../domain.dart';

class GetRoomUseCase {
  GetRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  Future<void> call(int roomId) async {
    await _roomRepository.getRoom(roomId);
  }

}