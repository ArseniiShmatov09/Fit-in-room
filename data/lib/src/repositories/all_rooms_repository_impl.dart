import 'package:domain/domain.dart';

class AllRoomsRepositoryImpl implements AllRoomsRepository {
  final List<RoomModel> _rooms = <RoomModel>[];

  @override
  Future<List<RoomModel>> getAllRooms() async {
    return _rooms;
  }
}
