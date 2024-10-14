part of 'edit_room_bloc.dart';

enum EditRoomStatus { loading, loaded, failure }

class EditRoomState {
  const EditRoomState({
    this.status = EditRoomStatus.loading,
    this.room,
  });

  final EditRoomStatus status;
  final RoomModel? room;

  EditRoomState copyWith({
    EditRoomStatus? status,
    RoomModel? room,
  }) {
    return EditRoomState(
      status: status ?? this.status,
      room: room ?? this.room,
    );
  }

  List<Object?> get props => <Object>[room!, status];
}
