import '../../domain.dart';

abstract class RoomRepository {
  Future<RoomModel> getRoom(String roomId);

  void addRoom(RoomModel roomModel);

  Future<void> deleteRoom(String roomId);

  Future<void> updateRoom(RoomModel newRoom);
}
