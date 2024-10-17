import '../../domain.dart';

class GetAllRoomsUseCase implements FutureUseCase<NoParams, List<RoomModel>>{
  GetAllRoomsUseCase({
    required AllRoomsRepository allRoomsRepository,
  }) : _allRoomsRepository = allRoomsRepository;

  final AllRoomsRepository _allRoomsRepository;

  @override
  Future<List<RoomModel>> execute(NoParams noParams) {
    return _allRoomsRepository.getAllRooms();
  }
}
