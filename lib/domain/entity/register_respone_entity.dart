class RegisterResponeEntity {
  String? message;
  UserEntity? user;
  String? token;

  RegisterResponeEntity({
    this.message,
    this.user,
    this.token,
  });
}

class UserEntity {
  String? name;
  String? email;

  UserEntity({
    this.name,
    this.email,
  });
}
