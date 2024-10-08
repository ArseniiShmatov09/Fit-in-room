import '../../domain.dart';

abstract class RoomRepository {
  Future<RoomModel> getRoom(int roomId);

  Future<void> addRoom(RoomModel roomModel);

  Future<void> deleteRoom(int roomId);

  Future<void> updateRoom(int oldRoomId, RoomModel newRoom);
}
