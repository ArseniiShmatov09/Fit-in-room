import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:tuple/tuple.dart';
import '../../data.dart';

class RoomRepositoryImpl implements RoomRepository {

  RoomRepositoryImpl({
    required ApiProvider apiProvider,
    required RoomMapper roomMapper,
  })  : _apiProvider = apiProvider,
        _roomMapper = roomMapper;

  final ApiProvider _apiProvider;
  final RoomMapper _roomMapper;

  @override
  void addRoom(RoomModel roomModel) {
    _apiProvider.addRoom(_roomMapper.toData(roomModel));
  }

  @override
  Future<void> deleteRoom(int roomId) async {
    final Tuple2<String, RoomModel> roomData = await getRoom(roomId).first;
    final String docId = roomData.item1;
    return _apiProvider.deleteRoom(docId);
  }

  @override
  Stream<Tuple2<String, RoomModel>> getRoom(int roomId) {
    return _apiProvider.getRoom(roomId).map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final RoomEntity roomEntity = RoomEntity.fromDocument(snapshot.docs.first);
        return Tuple2<String, RoomModel>(snapshot.docs.first.id, _roomMapper.toDomain(roomEntity));
      } else {
        throw Exception('Room not found');
      }
    });
  }

  @override
  Future<void> updateRoom(RoomModel newRoom) async {
    final Tuple2<String, RoomModel> roomData = await getRoom(newRoom.id).first;
    final String docId = roomData.item1;

    return _apiProvider.updateRoom(docId, _roomMapper.toData(newRoom));
  }
}
