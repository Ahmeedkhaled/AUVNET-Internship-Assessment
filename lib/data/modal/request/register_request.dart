import 'dart:convert';

class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  factory RegisterRequest.fromJson(String str) =>
      RegisterRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequest.fromMap(Map<String, dynamic> json) => RegisterRequest(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        rePassword: json["rePassword"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
      };
}
