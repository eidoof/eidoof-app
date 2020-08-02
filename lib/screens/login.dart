import "package:flutter/material.dart";
import "package:eidoof/widgets/login/login_form.dart";
import "package:eidoof/widgets/login/sign_up_form.dart";

Container _tab(List<Widget> children) {
  return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children));
}

class Login extends StatelessWidget {
  static const String route = "/login";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                bottom:
                    TabBar(tabs: [Tab(text: "Login"), Tab(text: "Sign up")])),
            body: Container(
                padding: const EdgeInsets.all(15),
                child: TabBarView(children: <Widget>[
                  LoginForm(),
                  SignUpForm(),
                ]))));
  }
}
