import '../../domain.dart';

class AddRoomUseCase {
  AddRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  Future<void> call(RoomModel roomModel) async {
    await _roomRepository.addRoom(roomModel);
  }
}