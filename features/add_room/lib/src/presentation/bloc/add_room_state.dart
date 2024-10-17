part of 'add_room_bloc.dart';

enum AddRoomStatus { added, failure }

class AddRoomState {
  const AddRoomState({
    this.status = AddRoomStatus.added,
    this.roomModel,
  });

  final AddRoomStatus status;
  final RoomModel? roomModel;

  AddRoomState copyWith({
    AddRoomStatus? status,
    RoomModel? roomModel,
  }) {
    return AddRoomState(
      status: status ?? this.status,
      roomModel: roomModel ?? this.roomModel,
    );
  }

  List<Object?> get props => <Object>[status];
}
