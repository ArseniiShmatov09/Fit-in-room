import '../../domain.dart';
import 'use_case.dart';

class AddRoomUseCase implements UseCase<RoomModel, void> {
  AddRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  @override
  void execute(RoomModel roomModel) {
    _roomRepository.addRoom(roomModel);
  }
}
