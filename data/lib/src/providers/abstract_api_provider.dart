import '../../data.dart';

abstract class AbstractApiProvider {
  Future<void> addRoom(RoomEntity roomEntity);

  Future<RoomEntity> getRoom(int roomId);

  Future<List<RoomEntity>> getAllRooms();

  Future<void> updateRoom(RoomEntity newRoom);

  Future<void> deleteRoom(int roomId);
}
