import 'package:domain/domain.dart';

import '../../data.dart';

class TestHistoryMapper {
  TestHistoryModel toDomain(TestHistoryEntity entity) => TestHistoryModel(
        id: entity.id,
        itemLength: entity.itemLength,
        itemWidth: entity.itemWidth,
        itemHeight: entity.itemHeight,
        roomName: entity.roomName,
        isTestPassed: entity.isTestPassed,
        username: entity.username,
      );

  TestHistoryEntity toData(TestHistoryModel model) => TestHistoryEntity(
        id: model.id,
        itemLength: model.itemLength,
        itemWidth: model.itemWidth,
        itemHeight: model.itemHeight,
        roomName: model.roomName,
        isTestPassed: model.isTestPassed,
        username: model.username,
      );
}
