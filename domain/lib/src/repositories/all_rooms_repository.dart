import '../../domain.dart';

abstract class AllRoomsRepository {
  Stream<List<RoomModel>> getAllRooms();
}
