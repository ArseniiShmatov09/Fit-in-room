import 'package:domain/domain.dart';

class RoomRepositoryImpl implements RoomRepository {
  final List<RoomModel> _rooms = <RoomModel>[];

  @override
  Future<void> addRoom(RoomModel roomModel) async {
    _rooms.add(roomModel);
  }

  @override
  Future<void> deleteRoom(int roomId) async {
    _rooms.removeWhere((RoomModel room) => room.id == roomId);
  }

  @override
  Future<RoomModel> getRoom(int roomId) async {
    return _rooms[roomId];
  }

  @override
  Future<void> updateRoom(int oldRoomId, RoomModel newRoom) async {
    _rooms[oldRoomId] = newRoom;
  }
}
