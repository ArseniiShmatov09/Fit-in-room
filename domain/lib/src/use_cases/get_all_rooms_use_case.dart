import '../../domain.dart';
import 'use_case.dart';

class GetAllRoomsUseCase implements UseCase<NoParams, List<RoomModel>>{
  GetAllRoomsUseCase({
    required AllRoomsRepository allRoomsRepository,
  }) : _allRoomsRepository = allRoomsRepository;

  final AllRoomsRepository _allRoomsRepository;

  @override
  List<RoomModel> execute(NoParams noParams) {
    return _allRoomsRepository.getAllRooms();
  }
}
