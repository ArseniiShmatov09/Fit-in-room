import '../../../domain.dart';

class AddRoomUseCase implements FutureUseCase<RoomModel, void> {
  AddRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  @override
  Future<void> execute(RoomModel roomModel) {
    return _roomRepository.addRoom(roomModel);
  }
}
