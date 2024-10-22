
abstract class FirebaseProvider {
  Future<void> addRoom(Map<String, dynamic> roomData);

  Future<Map<String, dynamic>> getRoom(String roomId);

  Future<String> getDocId(String roomId);

  Future<List<Map<String, dynamic>>> getAllRooms();

  Future<void> updateRoom(String docId, Map<String, dynamic> roomData);

  Future<void> deleteRoom(String docId);

  Future<List<Map<String, dynamic>>> getAllTestHistories();

  Future<void> addTestHistory(Map<String, dynamic> testHistoryData);

}
