

import 'package:flutter/material.dart';

AppBar generateBar() {

  return AppBar(
    backgroundColor: Colors.green,
    title: Center(
        child: Text("eidoof")
    ),
    actions: [
      Padding(
        padding: EdgeInsets.all(16.0),
        child:Icon(Icons.search),
        ),
    ],
  );
}