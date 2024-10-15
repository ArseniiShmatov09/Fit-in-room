import 'package:tuple/tuple.dart';

import '../../domain.dart';

class GetRoomUseCase implements StreamUseCase<String, Tuple2<String,RoomModel>> {
  GetRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  @override
  Stream<Tuple2<String,RoomModel>> execute(String roomId) {
    return _roomRepository.getRoom(roomId);
  }
}
