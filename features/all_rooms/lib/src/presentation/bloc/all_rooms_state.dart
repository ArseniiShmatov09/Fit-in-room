part of 'all_rooms_bloc.dart';


class AllRoomsState {
  const AllRoomsState();

  List<Object?> get props => <Object>[];
}

class AllRoomsLoadingState extends AllRoomsState {
  const AllRoomsLoadingState();
}

class AllRoomsLoadedState extends AllRoomsState {
  const AllRoomsLoadedState(this.rooms);

  final List<RoomModel> rooms;
  @override
  List<Object?> get props => super.props..add(rooms);
}

class AllRoomsLoadingFailureState extends AllRoomsState {
  const AllRoomsLoadingFailureState(this.exception);

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}