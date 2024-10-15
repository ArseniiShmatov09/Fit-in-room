import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

part 'edit_room_state.dart';

part 'edit_room_event.dart';

class EditRoomBloc extends Bloc<EditRoomEvent, EditRoomState> {
  EditRoomBloc({
    required GetRoomUseCase getRoomUseCase,
    required UpdateRoomUseCase updateRoomUseCase,
    required String roomId,
  })  : _getRoomUseCase = getRoomUseCase,
        _updateRoomUseCase = updateRoomUseCase,
        super(const EditRoomState()) {
    on<LoadEditRoomEvent>(_loadRoom);
    on<UpdateRoomEvent>(_updateRoom);
    add(
      LoadEditRoomEvent(roomId),
    );
  }

  final GetRoomUseCase _getRoomUseCase;
  final UpdateRoomUseCase _updateRoomUseCase;

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

      final Stream<Tuple2<String, RoomModel>> roomStream =
          _getRoomUseCase.execute(event.roomId);

      await emit.forEach<Tuple2<String, RoomModel>>(
        roomStream,
        onData: (Tuple2<String, RoomModel> roomData) {
          final RoomModel room = roomData.item2;
          return state.copyWith(
            status: EditRoomStatus.loaded,
            room: room,
          );
        },
        onError: (_, __) => state.copyWith(status: EditRoomStatus.failure),
      );
    } catch (e) {
      emit(
        state.copyWith(status: EditRoomStatus.failure),
      );
    }
  }

  Future<void> _updateRoom(
    UpdateRoomEvent event,
    Emitter<EditRoomState> emit,
  ) async {
    try {
      final RoomModel roomModel = RoomModel(
        id: event.id,
        name: event.name,
        length: event.length,
        width: event.width,
        height: event.height,
        userId: 1, //Todo change logic
      );

      await _updateRoomUseCase.execute(roomModel);
      emit(
        state.copyWith(status: EditRoomStatus.edited),
      );
    } catch (e) {
      emit(
        state.copyWith(status: EditRoomStatus.failure),
      );
    }
  }
}
