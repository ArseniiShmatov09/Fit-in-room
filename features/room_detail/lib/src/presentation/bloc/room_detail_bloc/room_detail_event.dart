part of 'room_detail_bloc.dart';

sealed class RoomDetailEvent {
  const RoomDetailEvent();

  List<Object> get props => <Object>[];
}

class LoadRoomDetailEvent extends RoomDetailEvent {
  const LoadRoomDetailEvent({
    required this.roomId,
  });

  final String roomId;

  @override
  List<Object> get props => <Object>[
        roomId,
      ];
}

class DeleteRoomDetailEvent extends RoomDetailEvent {
  const DeleteRoomDetailEvent({
    required this.roomId,
  });

  final String roomId;

  @override
  List<Object> get props => <Object>[
        roomId,
      ];
}

class UpdateRoomDetailEvent extends RoomDetailEvent {
  const UpdateRoomDetailEvent({
    required this.roomId,
  });

  final String roomId;

  @override
  List<Object> get props => <Object>[
        roomId,
      ];
}
