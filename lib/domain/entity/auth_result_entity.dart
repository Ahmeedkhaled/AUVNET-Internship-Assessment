import 'package:task_auvnet/domain/entity/register_respone_entity.dart';

class AuthResultEntity {
  UserEntity? userEntity;
  String? token;
  AuthResultEntity({this.userEntity, this.token});
}
