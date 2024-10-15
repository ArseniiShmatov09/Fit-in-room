import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data.dart';

abstract class AbstractApiProvider {
  Future<void> addRoom(RoomEntity roomEntity);

  Stream<QuerySnapshot<Map<String, dynamic>>> getRoom(String roomId);

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllRooms();

  Future<void> updateRoom(String docId, RoomEntity newRoom);

  Future<void> deleteRoom(String docId);
}
