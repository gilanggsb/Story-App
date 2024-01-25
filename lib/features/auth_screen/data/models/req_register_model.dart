class ReqRegisterModel {
  final String? name;
  final String? email;
  final String? password;

  ReqRegisterModel({
    required this.name,
    required this.email,
    this.password,
  });

  factory ReqRegisterModel.fromJson(Map<String, dynamic> json) =>
      ReqRegisterModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
