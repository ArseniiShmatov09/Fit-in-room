import '../../domain.dart';

abstract class RoomRepository {
  RoomModel getRoom(int roomId);

  void addRoom(RoomModel roomModel);

  void deleteRoom(int roomId);

  void updateRoom(RoomModel newRoom);
}
