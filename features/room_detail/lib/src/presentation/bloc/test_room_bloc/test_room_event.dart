part of 'test_room_bloc.dart';

abstract class TestRoomEvent {}

class ValidateInputEvent extends TestRoomEvent {

  final String itemWidth;
  final String itemLength;
  final String itemHeight;
  final int roomWidth;
  final int roomLength;
  final int roomHeight;

  ValidateInputEvent({

    required this.itemWidth,
    required this.itemLength,
    required this.itemHeight,
    required this.roomWidth,
    required this.roomLength,
    required this.roomHeight,
  });
}


class RunTestEvent extends TestRoomEvent {
  final String id;
  final String roomName;
  final int itemWidth;
  final int itemLength;
  final int itemHeight;
  final int roomWidth;
  final int roomLength;
  final int roomHeight;

  RunTestEvent({
    required this.id,
    required this.roomName,
    required this.itemWidth,
    required this.itemLength,
    required this.itemHeight,
    required this.roomWidth,
    required this.roomLength,
    required this.roomHeight,
  });
}
