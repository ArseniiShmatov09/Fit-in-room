import 'package:tuple/tuple.dart';

import '../../domain.dart';

abstract class RoomRepository {
  Stream<Tuple2<String, RoomModel>> getRoom(int roomId);

  void addRoom(RoomModel roomModel);

  Future<void> deleteRoom(int roomId);

  Future<void> updateRoom(RoomModel newRoom);
}
