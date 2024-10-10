import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_rooms_state.dart';

part 'all_rooms_event.dart';

class AllRoomsBloc extends Bloc<AllRoomsEvent, AllRoomsState> {
  AllRoomsBloc({
    required GetAllRoomsUseCase getAllRoomsUseCase,
  })  : _getAllRoomsUseCase = getAllRoomsUseCase,
        super(const AllRoomsState()) {
    on<LoadAllRoomsEvent>(_loadAllRooms);
    add(const LoadAllRoomsEvent());
  }

  final GetAllRoomsUseCase _getAllRoomsUseCase;

  Future<void> _loadAllRooms(
    LoadAllRoomsEvent event,
    Emitter<AllRoomsState> emit,
  ) async {
    try {
      if (state.status == AllRoomsStatus.loading) {
        emit(
          state.copyWith(
            status: AllRoomsStatus.loading,
          ),
        );
      }

      final List<RoomModel> rooms =
          await _getAllRoomsUseCase.execute(const NoParams());

      emit(
        state.copyWith(
          status: AllRoomsStatus.loaded,
          rooms: rooms,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AllRoomsStatus.failure),
      );
    }
  }
}
