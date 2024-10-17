import '../../domain.dart';

class GetRoomUseCase implements FutureUseCase<String, RoomModel> {
  GetRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  @override
  Future<RoomModel> execute(String roomId)  {
    return _roomRepository.getRoom(roomId);
  }
}
