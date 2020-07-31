import "package:flutter/material.dart";
import "package:eidoof/widgets/login_form.dart";

class Login extends StatelessWidget {
  static const String route = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              LoginForm(),
            ],
          )),
    );
  }
}
