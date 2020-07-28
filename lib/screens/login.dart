import "package:async/async.dart";

import "package:flutter/material.dart";
import "package:eidoof/services/api_client.dart";
import "package:eidoof/models/user.dart";
import "package:eidoof/screens/home.dart";
import "package:eidoof/widgets/slide_item.dart";
import "package:eidoof/models/slide.dart";

class Login extends StatefulWidget {
  static const String route = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final PageController _pageController = PageController(initialPage: 0);
  RestartableTimer _timer;

  @override
  void initState() {
    super.initState();

    // TODO Check if we are authenticated
    authenticate().then((User user) {
      // TODO We are authenticated so go to the home view
      Navigator.popAndPushNamed(context, Home.route);
    }).catchError((err) {
      print(err);
    });

    // Initialize the timer
    _timer = RestartableTimer(Duration(seconds: 5), () {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Expanded(
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: (int index) =>
                        // Just reset the timer
                        setState(() => _timer.reset()),
                    itemBuilder: (context, i) =>
                        SlideItem(i % slideList.length))),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FlatButton(
                      child: Text("Get Started",
                          style: Theme.of(context).textTheme.subtitle1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {}),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Have an account?",
                            style: Theme.of(context).textTheme.subtitle2),
                        FlatButton(
                            child: Text("Login",
                                style: Theme.of(context).textTheme.subtitle2),
                            onPressed: () {}),
                      ])
                ])
          ]),
        ));
  }
}
