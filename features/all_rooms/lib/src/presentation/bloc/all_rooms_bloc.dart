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
  }

  final List<RoomModel> _rooms = <RoomModel>[];
  final GetAllRoomsUseCase _getAllRoomsUseCase;

  void _loadAllRooms(
    LoadAllRoomsEvent event,
    Emitter<AllRoomsState> emit,
  ) {
    try {
      if (state is! AllRoomsLoadedState) {
        emit(const AllRoomsLoadingState());
      }
      _rooms.addAll(_getAllRoomsUseCase.execute(const NoParams()));

      emit(
        AllRoomsLoadedState(
          List<RoomModel>.from(
            _rooms,
          ),
        ),
      );
    } catch (e) {
      emit(AllRoomsLoadingFailureState(e));
    }
  }
}
