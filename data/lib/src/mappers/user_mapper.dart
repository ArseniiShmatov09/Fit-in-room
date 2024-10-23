import 'package:domain/domain.dart';

import '../../data.dart';

class UserMapper {

  UserModel toDomain(UserEntity entity) => UserModel(
        username: entity.username,
        password: entity.password,
      );

  UserEntity toData(UserModel model) => UserEntity(
        username: model.username,
        password: model.password,
      );
}
