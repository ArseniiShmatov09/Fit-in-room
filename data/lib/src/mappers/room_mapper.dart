import 'package:domain/domain.dart';

import '../../data.dart';

class RoomMapper {
  RoomModel toModel(RoomEntity entity) => RoomModel(
        id: entity.id,
        name: entity.name,
        length: entity.length,
        width: entity.width,
        height: entity.height,
        userId: entity.userId,
      );

  RoomEntity fromModel(RoomModel model) => RoomEntity(
        id: model.id,
        name: model.name,
        length: model.length,
        width: model.width,
        height: model.height,
        userId: model.userId,
      );
}
