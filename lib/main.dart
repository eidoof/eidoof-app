import 'package:flutter/material.dart';

import "package:eidoof/screens/home.dart";
import "package:eidoof/screens/login.dart";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Home.route:
      return MaterialPageRoute(
          builder: (context) => Home(user: settings.arguments));
    case Login.route:
      return MaterialPageRoute(builder: (context) => Login());
    default:
      return MaterialPageRoute(builder: (context) => Login());
  }
}

void main() {
  runApp(MaterialApp(
    title: "eidoof",
    onGenerateRoute: generateRoute,
    initialRoute: Login.route,
  ));
}

