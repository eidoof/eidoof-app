import 'package:flutter/material.dart';

Card feedItem(context, idx, imageList) {
  const border_radius = 15.0;
  const image_height = 150.0;
  const left_padding = 10.0;

  // https://medium.com/@dltlabs/how-to-build-a-flutter-card-list-in-less-than-10-minutes-9839f79a6c08
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(border_radius),
    ),
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(border_radius),
              topRight: Radius.circular(border_radius)),
          child: Image.network(imageList[idx],
              height: image_height, width: double.infinity, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: left_padding,
            top: 5,
            bottom: 3,
          ),
          child: Text(
            'Food McFoodFace',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: left_padding),
          child: Text(
            'Stuff it in your mouth! Do it, dummy, you will love it! amazing food shit right here',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: left_padding,
            bottom: 3,
          ),
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star_border, color: Colors.orange, size: 20),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3, left: left_padding),
          child: Row(
            children: [
              Icon(
                Icons.attach_money,
                color: Colors.green,
              ),
              Text("Pretty Cheap")
            ],
          ),
        ),
        Stack(children: [
          Align(
              child: Icon(Icons.favorite_border), alignment: Alignment(0.7, 1)),
          Align(child: Icon(Icons.favorite), alignment: Alignment(0.9, 1)),
          Padding(
            padding: const EdgeInsets.only(left: left_padding, bottom: 15),
            child: Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.blueAccent,
                ),
                Text("15 min"),
              ],
            ),
          ),
        ]),
      ],
    ),
  );
}
