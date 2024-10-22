import 'package:domain/domain.dart';

import '../../data.dart';

class RoomMapper {
  RoomModel toDomain(RoomEntity entity) => RoomModel(
        id: entity.id,
        name: entity.name,
        length: entity.length,
        width: entity.width,
        height: entity.height,
        username: entity.username,
      );

  RoomEntity toData(RoomModel model) => RoomEntity(
        id: model.id,
        name: model.name,
        length: model.length,
        width: model.width,
        height: model.height,
        username: model.username,
  );
}
