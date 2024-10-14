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

class UpdateRoomEvent extends EditRoomEvent {
  final int id;
  final String name;
  final int width;
  final int length;
  final int height;
  final int userId;

  UpdateRoomEvent({
    required this.id,
    required this.name,
    required this.width,
    required this.length,
    required this.height,
    required this.userId,
  });

  @override
  List<Object> get props => <Object>[
        id,
        name,
        width,
        length,
        height,
        userId,
      ];
}
