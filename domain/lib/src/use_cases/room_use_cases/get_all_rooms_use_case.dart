import '../../../domain.dart';

class GetAllRoomsUseCase implements FutureUseCase<String, List<RoomModel>>{
  GetAllRoomsUseCase({
    required AllRoomsRepository allRoomsRepository,
  }) : _allRoomsRepository = allRoomsRepository;

  final AllRoomsRepository _allRoomsRepository;

  @override
  Future<List<RoomModel>> execute(String username) {
    return _allRoomsRepository.getAllRooms(username);
  }
}
