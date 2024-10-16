
abstract class TestRoomFitRepository {
  bool testRoomFit(RoomFitParams  params);
}

class RoomFitParams {
  final int itemWidth;
  final int itemLength;
  final int itemHeight;
  final int roomWidth;
  final int roomLength;
  final int roomHeight;

  RoomFitParams({
    required this.itemWidth,
    required this.itemLength,
    required this.itemHeight,
    required this.roomWidth,
    required this.roomLength,
    required this.roomHeight,
  });
}