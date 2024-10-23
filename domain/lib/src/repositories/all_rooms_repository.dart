
import '../../domain.dart';

abstract class AllRoomsRepository {
  Future<List<RoomModel>> getAllRooms(String username);
}
