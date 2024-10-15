import 'package:tuple/tuple.dart';

import '../../domain.dart';

abstract class RoomRepository {
  Stream<Tuple2<String, RoomModel>> getRoom(String roomId);

  void addRoom(RoomModel roomModel);

  Future<void> deleteRoom(String roomId);

  Future<void> updateRoom(RoomModel newRoom);
}
