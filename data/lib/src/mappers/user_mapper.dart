import 'package:domain/domain.dart';

import '../../data.dart';

class UserMapper {

  UserModel toDomain(UserEntity entity) => UserModel(
        username: entity.username,
        email: entity.email,
        password: entity.password,
      );

  UserEntity toData(UserModel model) => UserEntity(
        username: model.username,
        password: model.password,
        email: model.email,
      );
}
