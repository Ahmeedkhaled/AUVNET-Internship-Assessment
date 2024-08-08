class LoginRequest {
  String? password;
  String? email;

  LoginRequest({
    this.password,
    this.email,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
      };
}
