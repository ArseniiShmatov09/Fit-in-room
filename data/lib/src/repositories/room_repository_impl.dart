import 'package:domain/domain.dart';
import '../../data.dart';

class RoomRepositoryImpl implements RoomRepository {

  RoomRepositoryImpl({
    required FirebaseProviderImpl apiProvider,
    required RoomMapper roomMapper,
  })  : _apiProvider = apiProvider,
        _roomMapper = roomMapper;

  final FirebaseProviderImpl _apiProvider;
  final RoomMapper _roomMapper;

  @override
  Future<void> addRoom(RoomModel roomModel) {
    return _apiProvider.addRoom(_roomMapper.toData(roomModel).toJson());
  }

  @override
  Future<void> deleteRoom(String roomId) async {
    final String docId = await _apiProvider.getDocId(roomId);
    return _apiProvider.deleteRoom(docId);
  }

  @override
  Future<RoomModel> getRoom(String roomId) async{
    return _roomMapper.toDomain(RoomEntity.fromJson(await _apiProvider.getRoom(roomId)));
  }

  @override
  Future<void> updateRoom(RoomModel newRoom) async {
    final String docId = await _apiProvider.getDocId(newRoom.id);
    return _apiProvider.updateRoom(docId, _roomMapper.toData(newRoom).toJson());
  }
}
