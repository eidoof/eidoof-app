import 'package:flutter/material.dart';

class Undefined extends StatelessWidget {
  final String name;
  const Undefined({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for $name is undefined'),
      ),
    );
  }
}
