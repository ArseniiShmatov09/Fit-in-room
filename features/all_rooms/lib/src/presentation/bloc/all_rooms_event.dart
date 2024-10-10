part of 'all_rooms_bloc.dart';

sealed class AllRoomsEvent {
  const AllRoomsEvent();

  List<Object> get props => <Object>[];
}

class LoadAllRoomsEvent extends AllRoomsEvent {
  const LoadAllRoomsEvent();

  @override
  List<Object> get props => <Object>[];
}
