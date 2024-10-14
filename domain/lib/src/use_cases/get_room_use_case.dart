import 'package:tuple/tuple.dart';

import '../../domain.dart';

class GetRoomUseCase implements StreamUseCase<int, Tuple2<String,RoomModel>> {
  GetRoomUseCase({
    required RoomRepository roomRepository,
  }) : _roomRepository = roomRepository;

  final RoomRepository _roomRepository;

  @override
  Stream<Tuple2<String,RoomModel>> execute(int roomId) {
    return _roomRepository.getRoom(roomId);
  }
}
