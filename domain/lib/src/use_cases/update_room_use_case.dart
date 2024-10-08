import '../../domain.dart';
import 'use_case.dart';

class UpdateRoomUseCase implements UseCase<RoomModel, void> {
  UpdateRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  @override
  void execute(RoomModel newRoom) {
    _roomRepository.updateRoom(newRoom);
  }
}
