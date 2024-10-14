import '../../domain.dart';

class UpdateRoomUseCase implements FutureUseCase<RoomModel, void> {
  UpdateRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  @override
  Future<void> execute(RoomModel newRoom) async {
    await _roomRepository.updateRoom(newRoom);
  }
}
