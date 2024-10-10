import 'package:domain/domain.dart';
import '../../data.dart';

class AllRoomsRepositoryImpl implements AllRoomsRepository {
  final List<RoomEntity> _rooms = List<RoomEntity>.generate(100, (int index) {
    return RoomEntity(
      id: index + 1,
      name: 'Room $index',
      length: 10 + index,
      width: 8 + index,
      height: 3,
      userId: index % 10,
    );
  });

  final RoomMapper _mapper = RoomMapper();

  @override
  List<RoomModel> getAllRooms() {
    return _rooms.map(_mapper.toDomain).toList();
  }
}
