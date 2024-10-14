import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import '../../data.dart';

class AllRoomsRepositoryImpl implements AllRoomsRepository {
  AllRoomsRepositoryImpl({
    required ApiProvider apiProvider,
    required RoomMapper roomMapper,
  })  : _apiProvider = apiProvider,
        _roomMapper = roomMapper;

  final ApiProvider _apiProvider;
  final RoomMapper _roomMapper;

  @override
  Stream<List<RoomModel>> getAllRooms() {
    return _apiProvider.getAllRooms().map(
      (QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        return querySnapshot.docs
            .map(
              (QueryDocumentSnapshot<Map<String, dynamic>> doc) {
                final RoomEntity roomEntity = RoomEntity.fromDocument(doc);
                return _roomMapper.toDomain(roomEntity);
              },
            )
            .where((RoomModel? room) => room != null)
            .cast<RoomModel>()
            .toList();
      },
    );
  }
}
