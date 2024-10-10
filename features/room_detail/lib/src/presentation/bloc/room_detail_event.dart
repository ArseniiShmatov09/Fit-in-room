part of 'room_detail_bloc.dart';

sealed class RoomDetailEvent {
  const RoomDetailEvent();

  List<Object> get props => <Object>[];
}

class LoadRoomDetailEvent extends RoomDetailEvent {
  const LoadRoomDetailEvent(this.roomId);

  final int roomId;

  @override
  List<Object> get props => <Object>[
        roomId,
      ];
}
