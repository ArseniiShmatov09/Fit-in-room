import 'package:domain/domain.dart';

import '../../data.dart';

class TestHistoryMapper {
  TestHistoryModel toDomain(TestHistoryEntity entity) => TestHistoryModel(
        id: entity.id,
        itemLength: entity.itemLength,
        itemWidth: entity.itemWidth,
        itemHeight: entity.itemHeight,
        roomId: entity.roomId,
        isTestPassed: entity.isTestPassed,
      );

  TestHistoryEntity toData(TestHistoryModel model) => TestHistoryEntity(
        id: model.id,
        itemLength: model.itemLength,
        itemWidth: model.itemWidth,
        itemHeight: model.itemHeight,
        roomId: model.roomId,
        isTestPassed: model.isTestPassed,
      );
}
