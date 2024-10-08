import 'package:domain/domain.dart';

import '../../data.dart';

class TestHistoryMapper {
  TestHistoryModel toModel(TestHistoryEntity entity) => TestHistoryModel(
        id: entity.id,
        itemLength: entity.itemLength,
        itemWidth: entity.itemWidth,
        itemHeight: entity.itemHeight,
        roomId: entity.roomId,
      );

  TestHistoryEntity fromModel(TestHistoryModel model) => TestHistoryEntity(
        id: model.id,
        itemLength: model.itemLength,
        itemWidth: model.itemWidth,
        itemHeight: model.itemHeight,
        roomId: model.roomId,
      );
}
