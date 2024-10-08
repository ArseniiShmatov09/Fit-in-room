import 'package:domain/domain.dart';
import '../../data.dart';

class RoomRepositoryImpl implements RoomRepository {
  final List<RoomEntity> _rooms = List<RoomEntity>.generate(100, (int index) {
    return RoomEntity(
      id: index + 1,
      name: 'Room $index',
      length: 10 + index,
      width: 8 + index,
      height: 3,
      userId: index % 10,
    );
  });

  final RoomMapper _mapper = RoomMapper();

  @override
  void addRoom(RoomModel roomModel) {
    // _rooms.add(roomModel);
  }

  @override
  void deleteRoom(int roomId) {
    // _rooms.removeWhere((RoomModel room) => room.id == roomId);
  }

  @override
  RoomModel getRoom(int roomId) {
    return _mapper.toDomain(_rooms[roomId]);
  }

  @override
  void updateRoom(RoomModel newRoom) {
    //_rooms[oldRoomId] = newRoom;
  }
}
