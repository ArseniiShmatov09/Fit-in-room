import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'room_detail_state.dart';

part 'room_detail_event.dart';

class RoomDetailBloc extends Bloc<RoomDetailEvent, RoomDetailState> {
  RoomDetailBloc({
    required GetRoomUseCase getRoomUseCase,
    required DeleteRoomUseCase deleteRoomUseCase,
    required String roomId,
  })  : _getRoomUseCase = getRoomUseCase,
        _deleteRoomUseCase = deleteRoomUseCase,
        super(const RoomDetailState()) {
    on<LoadRoomDetailEvent>(_loadRoom);
    on<DeleteRoomDetailEvent>(_deleteRoom);
    on<UpdateRoomDetailEvent>(
        (UpdateRoomDetailEvent event, Emitter<RoomDetailState> emit) async {
      await _loadRoom(LoadRoomDetailEvent(roomId: event.roomId), emit);
    });
    add(
      LoadRoomDetailEvent(roomId: roomId),
    );
  }

  final GetRoomUseCase _getRoomUseCase;
  final DeleteRoomUseCase _deleteRoomUseCase;

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
          room: room,
          status: RoomDetailStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: RoomDetailStatus.failure),
      );
    }
  }

  Future<void> _deleteRoom(
    DeleteRoomDetailEvent event,
    Emitter<RoomDetailState> emit,
  ) async {
    try {
      await _deleteRoomUseCase.execute(event.roomId);
      emit(
        state.copyWith(status: RoomDetailStatus.successfullyDeleted),
      );
    } catch (e) {
      state.copyWith(status: RoomDetailStatus.failureDeleted);
    }
  }
}
