import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import "package:eidoof/screens/home.dart";
import "package:eidoof/screens/getting_started.dart";
import "package:eidoof/screens/login.dart";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Home.route:
      return MaterialPageRoute(builder: (context) => Home());
    case GettingStarted.route:
      return MaterialPageRoute(builder: (context) => GettingStarted());
    case Login.route:
      return MaterialPageRoute(builder: (context) => Login());
    default:
      return MaterialPageRoute(builder: (context) => GettingStarted());
  }
}

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    title: "eidoof",
    onGenerateRoute: generateRoute,
    home: GettingStarted(),
  ));
}
