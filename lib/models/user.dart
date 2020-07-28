class User {
  final String email;
  final String username;
  final String token;
  final String refreshToken;

  User({this.email, this.username, this.token, this.refreshToken});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json["email"],
        username: json["username"],
        token: json["token"],
        refreshToken: json["refresh_token"]
      );
  }
}
