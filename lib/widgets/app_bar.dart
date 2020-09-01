import 'package:flutter/material.dart';
import 'package:eidoof/widgets/search.dart';

AppBar generateBar(context) {
  return AppBar(
    backgroundColor: Colors.green,
    title: Center(child: Text("eidoof")),
    actions: [
      Padding(
        padding: EdgeInsets.all(16.0),
        child: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            popupSearch(context);
          },
        ),

      ),
    ],
  );
}

