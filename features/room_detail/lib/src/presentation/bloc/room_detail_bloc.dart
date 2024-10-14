import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

part 'room_detail_state.dart';

part 'room_detail_event.dart';

class RoomDetailBloc extends Bloc<RoomDetailEvent, RoomDetailState> {
  RoomDetailBloc({
    required GetRoomUseCase getRoomUseCase,
    required DeleteRoomUseCase deleteRoomUseCase,
    required int roomId,
  })  : _getRoomUseCase = getRoomUseCase,
        _deleteRoomUseCase = deleteRoomUseCase,
        super(const RoomDetailState()) {
    on<LoadRoomDetailEvent>(_loadRoom);
    on<DeleteRoomDetailEvent>(_deleteRoom);
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

      final Stream<Tuple2<String, RoomModel>> roomStream =
          _getRoomUseCase.execute(event.roomId);

      await emit.forEach<Tuple2<String, RoomModel>>(
        roomStream,
        onData: (Tuple2<String, RoomModel> roomData) {
          final RoomModel room = roomData.item2;
          return state.copyWith(
            status: RoomDetailStatus.loaded,
            room: room,
          );
        },
        onError: (_, __) => state.copyWith(status: RoomDetailStatus.failure),
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
