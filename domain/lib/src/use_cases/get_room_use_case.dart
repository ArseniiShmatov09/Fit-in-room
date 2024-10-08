import '../../domain.dart';
import 'use_case.dart';

class GetRoomUseCase implements UseCase<int, RoomModel> {
  GetRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  @override
  RoomModel execute(int roomId) {
    return _roomRepository.getRoom(roomId);
  }
}
