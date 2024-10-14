import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/room_entity.dart';
import 'abstract_api_provider.dart';

class ApiProvider implements AbstractApiProvider {
  final CollectionReference<Map<String, dynamic>> rooms =
      FirebaseFirestore.instance.collection('rooms');

  @override
  Future<void> addRoom(RoomEntity roomEntity) {
    return rooms.add(<String, dynamic>{
      'id': roomEntity.id,
      'name' : roomEntity.name,
      'length' : roomEntity.length,
      'width' : roomEntity.width,
      'height' : roomEntity.userId,
    });
  }

  @override
  Future<void> deleteRoom(int roomId) {
    // TODO: implement deleteRoom
    throw UnimplementedError();
  }

  @override
  Future<List<RoomEntity>> getAllRooms() {
    // TODO: implement getAllRooms
    throw UnimplementedError();
  }

  @override
  Future<RoomEntity> getRoom(int roomId) {
    // TODO: implement getRoom
    throw UnimplementedError();
  }

  @override
  Future<void> updateRoom(RoomEntity newRoom) {
    // TODO: implement updateRoom
    throw UnimplementedError();
  }
}
