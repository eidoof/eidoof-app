import 'dart:convert';
import 'dart:io';

import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart" as http;
import "package:eidoof/models/user.dart";
import "package:eidoof/models/user_in_login.dart";

// TODO This should not be hardcoded
const baseUrl = "http://localhost";

final storage = FlutterSecureStorage();

Future<Map<String, String>> authHeader() async {
  Map<String, String> tokens = await storage.readAll();
  if (tokens.isEmpty) throw ("Storage is empty");

  return {
    HttpHeaders.authorizationHeader:
        "Token ${tokens["token"]};Refresh ${tokens["refresh"]}"
  };
}

Future<UserModel> authenticate() async {
  // Check if we have any tokens already stored.
  final headers = await authHeader().catchError((err) {
    return null;
  });

  // Check if the tokens are still valid.
  final url = "$baseUrl/user";
  final response = await http.get(url, headers: headers);

  // TODO Proper logging
  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");

  // TODO Handle any other status-codes that we could get from the /user endpoint
  if (response.statusCode != 200) return null;

  // If we're authenticated, the user model shoud be returned in the response body
  final responseJson = json.decode(response.body);
  final user = UserModel.fromJson(responseJson);
  print("User model: $user");

  return user;
}

Future<UserModel> login(UserInLoginModel userInLogin) async {
  final url = "$baseUrl/login";
  final response = await http.post(url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: userInLogin.toJson().toString());

  // TODO Proper logging
  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");

  // TODO Handle any other status-codes that we could get from the /user endpoint
  if (response.statusCode != 200) return null;

  // If we're authenticated, the user model shoud be returned in the response body
  final responseJson = json.decode(response.body);
  final user = UserModel.fromJson(responseJson);
  print("User model: $user");

  return user;
}
