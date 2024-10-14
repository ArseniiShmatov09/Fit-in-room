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
  final int userId;

  LoadAddRoomEvent({
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
