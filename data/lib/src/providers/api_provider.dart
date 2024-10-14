import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/room_entity.dart';
import 'abstract_api_provider.dart';

class ApiProvider implements AbstractApiProvider {
  final CollectionReference<Map<String, dynamic>> _rooms =
      FirebaseFirestore.instance.collection('rooms');

  @override
  Future<void> addRoom(RoomEntity roomEntity) {
    return _rooms.add(<String, dynamic>{
      'id': roomEntity.id,
      'name': roomEntity.name,
      'length': roomEntity.length,
      'width': roomEntity.width,
      'height': roomEntity.height,
      'userId': roomEntity.userId,
    });
  }

  @override
  Future<void> deleteRoom(String docId) async {
    await _rooms.doc(docId).delete();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllRooms() {
    return _rooms
        .orderBy(
          'id',
          descending: false,
        )
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getRoom(int roomId) {
    return _rooms.where('id', isEqualTo: roomId).snapshots();
  }

  @override
  Future<void> updateRoom(String docId, RoomEntity roomEntity) {
    return _rooms.doc(docId).update(<Object, Object?>{
      'id': roomEntity.id,
      'name': roomEntity.name,
      'length': roomEntity.length,
      'width': roomEntity.width,
      'height': roomEntity.height,
      'userId': roomEntity.userId,
    });
  }
}
