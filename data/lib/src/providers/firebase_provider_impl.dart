import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_provider.dart';

class FirebaseProviderImpl implements FirebaseProvider {
  final CollectionReference<Map<String, dynamic>> _rooms =
  FirebaseFirestore.instance.collection('rooms');
  final CollectionReference<Map<String, dynamic>> _testHistories =
  FirebaseFirestore.instance.collection('testHistories');

  @override
  Future<void> addRoom(Map<String, dynamic> roomData) {
    return _rooms.add(roomData);
  }

  @override
  Future<void> deleteRoom(String docId) async {
    await _rooms.doc(docId).delete();
  }

  @override
  Future<List<Map<String, dynamic>>> getAllRooms() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await _rooms.orderBy('id', descending: false).get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) => doc.data())
          .toList();
    } else {
      return <Map<String, dynamic>>[];
    }
  }

  @override
  Future<String> getDocId(String roomId) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await _rooms.where('id', isEqualTo: roomId).get();
    return snapshot.docs.first.id;
  }

  @override
  Future<Map<String, dynamic>> getRoom(String roomId) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await _rooms.where('id', isEqualTo: roomId).get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.data();
    } else {
      return <String, dynamic>{};
    }
  }

  @override
  Future<void> updateRoom(String docId, Map<String, dynamic> roomData) {
    return _rooms.doc(docId).update(roomData);
  }

  @override
  Future<List<Map<String, dynamic>>> getAllTestHistories() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await _testHistories.orderBy('roomName', descending: false).get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) => doc.data())
          .toList();
    } else {
      return <Map<String, dynamic>>[];
    }
  }

  @override
  Future<void> addTestHistory(Map<String, dynamic> testHistoryData) {
    return _testHistories.add(testHistoryData);
  }
}
