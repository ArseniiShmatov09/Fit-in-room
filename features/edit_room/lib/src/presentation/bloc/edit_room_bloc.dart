import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_room_state.dart';

part 'edit_room_event.dart';

class EditRoomBloc extends Bloc<EditRoomEvent, EditRoomState> {
  EditRoomBloc({
    required GetRoomUseCase getRoomUseCase,
    required int roomId,
  })  : _getRoomUseCase = getRoomUseCase,
        super(const EditRoomState()) {
    on<LoadEditRoomEvent>(_loadRoom);
    add(LoadEditRoomEvent(roomId));
  }

  final GetRoomUseCase _getRoomUseCase;

  Future<void> _loadRoom(
    LoadEditRoomEvent event,
    Emitter<EditRoomState> emit,
  ) async {
    try {
      if (state.status == EditRoomStatus.loading) {
        emit(
          state.copyWith(
            status: EditRoomStatus.loading,
          ),
        );
      }

      final RoomModel room = await _getRoomUseCase.execute(event.roomId);

      emit(
        state.copyWith(
          status: EditRoomStatus.loaded,
          room: room,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: EditRoomStatus.failure),
      );
    }
  }
}
