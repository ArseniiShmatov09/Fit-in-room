import 'package:domain/domain.dart';

class TestRoomFitRepositoryImpl implements TestRoomFitRepository {
  @override
  bool testRoomFit(RoomFitParams params) {
    return (params.itemWidth <= params.roomWidth &&
            params.itemLength <= params.roomLength &&
            params.itemHeight <= params.roomHeight) ||
        (params.itemWidth <= params.roomWidth &&
            params.itemHeight <= params.roomLength &&
            params.itemLength <= params.roomHeight) ||
        (params.itemLength <= params.roomWidth &&
            params.itemWidth <= params.roomLength &&
            params.itemHeight <= params.roomHeight) ||
        (params.itemLength <= params.roomWidth &&
            params.itemHeight <= params.roomLength &&
            params.itemWidth <= params.roomHeight) ||
        (params.itemHeight <= params.roomWidth &&
            params.itemWidth <= params.roomLength &&
            params.itemLength <= params.roomHeight) ||
        (params.itemHeight <= params.roomWidth &&
            params.itemLength <= params.roomLength &&
            params.itemWidth <= params.roomHeight);
  }
}
