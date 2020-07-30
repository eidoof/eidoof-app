import 'package:flutter/material.dart';
import "package:eidoof/models/slide.dart";

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(slideList[index].imagePath),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 30),
          Text(slideList[index].title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .apply(color: Theme.of(context).primaryColor)),
          SizedBox(height: 10),
          Text(slideList[index].description,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center),
        ]);
  }
}
