import 'dart:convert';

import 'package:task_auvnet/domain/entity/register_respone_entity.dart';

class UserDto {
  String? name;
  String? email;
  String? role;

  UserDto({
    this.name,
    this.email,
    this.role,
  });

  factory UserDto.fromJson(String str) => UserDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDto.fromMap(Map<String, dynamic> json) => UserDto(
        name: json["name"],
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "role": role,
      };

  UserEntity toUserEntity() {
    return UserEntity(email: email, name: name);
  }
}
