import 'package:domain/domain.dart';
import '../../data.dart';

class AllRoomsRepositoryImpl implements AllRoomsRepository {
  AllRoomsRepositoryImpl({
    required FirebaseProviderImpl apiProvider,
    required RoomMapper roomMapper,
  })  : _apiProvider = apiProvider,
        _roomMapper = roomMapper;

  final FirebaseProviderImpl _apiProvider;
  final RoomMapper _roomMapper;

  @override
  Future<List<RoomModel>> getAllRooms() async {
    final List<Map<String, dynamic>> roomData =
        await _apiProvider.getAllRooms();
    final List<RoomEntity> roomEntity =
        roomData.map(RoomEntity.fromJson).toList();
    return roomEntity.map(_roomMapper.toDomain).toList();
  }
}
