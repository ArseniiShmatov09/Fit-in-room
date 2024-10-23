import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_rooms_state.dart';

part 'all_rooms_event.dart';

class AllRoomsBloc extends Bloc<AllRoomsEvent, AllRoomsState> {
  AllRoomsBloc({
    required GetAllRoomsUseCase getAllRoomsUseCase,
    required UserModel user,
  })  : _getAllRoomsUseCase = getAllRoomsUseCase,
        super(const AllRoomsState()) {
    on<LoadAllRoomsEvent>(_loadAllRooms);

    add(LoadAllRoomsEvent(user: user));
  }

  final GetAllRoomsUseCase _getAllRoomsUseCase;

  Future<void> _loadAllRooms(
    LoadAllRoomsEvent event,
    Emitter<AllRoomsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AllRoomsStatus.loading));

      final List<RoomModel> rooms =
          await _getAllRoomsUseCase.execute(event.user.username);

      emit(
        state.copyWith(
          rooms: rooms,
          status: AllRoomsStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AllRoomsStatus.failure),
      );
    }
  }
}
