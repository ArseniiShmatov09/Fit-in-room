import '../../domain.dart';

class GetAllRoomsUseCase implements StreamUseCase<NoParams, List<RoomModel>>{
  GetAllRoomsUseCase({
    required AllRoomsRepository allRoomsRepository,
  }) : _allRoomsRepository = allRoomsRepository;

  final AllRoomsRepository _allRoomsRepository;

  @override
  Stream<List<RoomModel>> execute(NoParams noParams) {
    return _allRoomsRepository.getAllRooms();
  }
}
