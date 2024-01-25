class UserModel {
  final String? userId;
  final String? name;
  final String? token;

  UserModel({
    this.userId,
    this.name,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        name: json["name"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "token": token,
      };
}
