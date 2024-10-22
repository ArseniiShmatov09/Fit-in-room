part of 'add_room_bloc.dart';

sealed class AddRoomEvent {
  const AddRoomEvent();

  List<Object> get props => <Object>[];
}

class LoadAddRoomEvent extends AddRoomEvent {
  final String id;
  final String name;
  final int width;
  final int length;
  final int height;
  final String username;

  LoadAddRoomEvent({
    required this.id,
    required this.name,
    required this.width,
    required this.length,
    required this.height,
    required this.username,
  });

  @override
  List<Object> get props => <Object>[
        id,
        name,
        width,
        length,
        height,
        username,
      ];
}
