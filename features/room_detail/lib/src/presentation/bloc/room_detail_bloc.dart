import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'room_detail_state.dart';

part 'room_detail_event.dart';

class RoomDetailBloc extends Bloc<RoomDetailEvent, RoomDetailState> {
  RoomDetailBloc({
    required GetRoomUseCase getRoomUseCase,
    required int roomId,
  })  : _getRoomUseCase = getRoomUseCase,
        super(const RoomDetailState()) {
    on<LoadRoomDetailEvent>(_loadRoom);
    add(LoadRoomDetailEvent(roomId));
  }

  final GetRoomUseCase _getRoomUseCase;

  Future<void> _loadRoom(
    LoadRoomDetailEvent event,
    Emitter<RoomDetailState> emit,
  ) async {
    try {
      if (state.status == RoomDetailStatus.loading) {
        emit(
          state.copyWith(
            status: RoomDetailStatus.loading,
          ),
        );
      }

      final RoomModel room = await _getRoomUseCase.execute(event.roomId);

      emit(
        state.copyWith(
          status: RoomDetailStatus.loaded,
          room: room,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: RoomDetailStatus.failure),
      );
    }
  }
}
