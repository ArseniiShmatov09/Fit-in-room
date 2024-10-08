import '../../domain.dart';

class GetAllRoomsUseCase {
  GetAllRoomsUseCase({
    required AllRoomsRepository allRoomsRepository,
  }) : _allRoomsRepository = allRoomsRepository;

  final AllRoomsRepository _allRoomsRepository;

  Future<List<RoomModel>> call() async {
    final List<RoomModel> list = await _allRoomsRepository.getAllRooms();
    return list;
  }
}
