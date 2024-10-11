part of 'add_room_bloc.dart';

sealed class AddRoomEvent {
  const AddRoomEvent();

  List<Object> get props => <Object>[];
}

class LoadAddRoomEvent extends AddRoomEvent {
  final int id;
  final String name;
  final int width;
  final int length;
  final int height;

  LoadAddRoomEvent(
    this.id,
    this.name,
    this.width,
    this.length,
    this.height,
  );

  @override
  List<Object> get props => <Object>[
        id,
        name,
        width,
        length,
        height,
      ];
}
