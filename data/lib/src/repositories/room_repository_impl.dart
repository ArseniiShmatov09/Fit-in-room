import 'package:domain/domain.dart';
import '../../data.dart';

class RoomRepositoryImpl implements RoomRepository {

  RoomRepositoryImpl({
    required ApiProvider apiProvider,
    required RoomMapper roomMapper,
  })  : _apiProvider = apiProvider,
        _roomMapper = roomMapper;

  final ApiProvider _apiProvider;
  final RoomMapper _roomMapper;

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

  @override
  void addRoom(RoomModel roomModel) {
    _apiProvider.addRoom(_roomMapper.toData(roomModel));
  }

  @override
  void deleteRoom(int roomId) {
    // _rooms.removeWhere((RoomModel room) => room.id == roomId);
  }

  @override
  RoomModel getRoom(int roomId) {
    return _roomMapper.toDomain(_rooms[roomId]);
  }

  @override
  void updateRoom(RoomModel newRoom) {
    //_rooms[oldRoomId] = newRoom;
  }
}
