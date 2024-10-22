import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_room_event.dart';

part 'add_room_state.dart';

class AddRoomBloc extends Bloc<AddRoomEvent, AddRoomState> {
  AddRoomBloc({
    required AddRoomUseCase addRoomUseCase,
  })  : _addRoomUseCase = addRoomUseCase,
        super(const AddRoomState()) {
    on<LoadAddRoomEvent>(_addRoom);
  }

  final AddRoomUseCase _addRoomUseCase;

  Future<void> _addRoom(
    LoadAddRoomEvent event,
    Emitter<AddRoomState> emit,
  ) async {
    try {
      final RoomModel roomModel = RoomModel(
        id: event.id,
        name: event.name,
        length: event.length,
        width: event.width,
        height: event.height,
        username: event.username,
      );
      await _addRoomUseCase.execute(roomModel);
      emit(
        state.copyWith(
          status: AddRoomStatus.added,
          roomModel: roomModel,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AddRoomStatus.failure),
      );
    }
  }
}
