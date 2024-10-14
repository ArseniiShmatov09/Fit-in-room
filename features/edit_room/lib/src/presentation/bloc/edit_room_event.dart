part of 'edit_room_bloc.dart';

sealed class EditRoomEvent {
  const EditRoomEvent();

  List<Object> get props => <Object>[];
}

class LoadEditRoomEvent extends EditRoomEvent {
  const LoadEditRoomEvent(this.roomId);

  final int roomId;

  @override
  List<Object> get props => <Object>[
        roomId,
      ];
}
