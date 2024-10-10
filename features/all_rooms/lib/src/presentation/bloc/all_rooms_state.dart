part of 'all_rooms_bloc.dart';

enum AllRoomsStatus { loading, loaded, failure }

class AllRoomsState {
  const AllRoomsState({
    this.status = AllRoomsStatus.loading,
    this.rooms = const <RoomModel>[],
  });

  final AllRoomsStatus status;
  final List<RoomModel> rooms;

  AllRoomsState copyWith({
    AllRoomsStatus? status,
    List<RoomModel>? rooms,
  }) {
    return AllRoomsState(
      status: status ?? this.status,
      rooms: rooms ?? this.rooms,
    );
  }

  List<Object?> get props => <Object>[rooms, status];
}
