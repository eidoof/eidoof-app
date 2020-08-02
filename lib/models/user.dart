import "dart:convert";

class UserModel {
  UserModel({this.email, this.username, this.token, this.refreshToken});

  final String email;
  final String username;
  final String token;
  final String refreshToken;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json["email"],
        username: json["username"],
        token: json["token"],
        refreshToken: json["refresh_token"]);
  }
}

class UserInLoginModel {
  UserInLoginModel(this.email, this.password);

  final String email;
  final String password;

  String toJson() => json.encode({
        "email": email,
        "password": password,
      });
}

class UserInRegisterModel {
  UserInRegisterModel(this.email, this.username, this.password);

  final String email;
  final String username;
  final String password;

  String toJson() => json.encode({
        "email": email,
        "username": username,
        "password": password,
      });
}
