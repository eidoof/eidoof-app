class UserInLoginModel {
  UserInLoginModel(this.email, this.password);

  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}