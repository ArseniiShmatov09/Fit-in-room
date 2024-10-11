import 'package:domain/domain.dart';
import '../../data.dart';

class AllRoomsRepositoryImpl implements AllRoomsRepository {
  final List<RoomEntity> _rooms = List<RoomEntity>.generate(100, (int index) {
    return RoomEntity(
      id: index,
      name: 'Room $index',
      length: 10 + index,
      width: 8 + index,
      height: 3,
      userId: index % 10,
    );
  });

  AllRoomsRepositoryImpl({
    required ApiProvider apiProvider,
    required RoomMapper roomMapper,
  })  : _apiProvider = apiProvider,
        _roomMapper = roomMapper;

  final ApiProvider _apiProvider;
  final RoomMapper _roomMapper;

  @override
  List<RoomModel> getAllRooms() {
    return _rooms.map(_roomMapper.toDomain).toList();
  }
}
