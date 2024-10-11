part of 'add_room_bloc.dart';

enum AddRoomStatus { added, failure }

class AddRoomState {
  const AddRoomState({
    this.status = AddRoomStatus.added,
  });

  final AddRoomStatus status;

  AddRoomState copyWith({
    AddRoomStatus? status,
  }) {
    return AddRoomState(
      status: status ?? this.status,
    );
  }

  List<Object?> get props => <Object>[status];
}
