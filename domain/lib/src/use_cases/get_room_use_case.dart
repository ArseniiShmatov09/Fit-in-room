import '../../domain.dart';

class GetRoomUseCase implements FutureUseCase<int, RoomModel> {
  GetRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  @override
  Future<RoomModel> execute(int roomId) async {
    return _roomRepository.getRoom(roomId);
  }
}
