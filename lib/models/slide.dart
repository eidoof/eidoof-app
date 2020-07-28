import "package:flutter/material.dart";

class Slide {
  final String imagePath;
  final String title;
  final String description;

  Slide(
      {@required this.imagePath,
      @required this.title,
      @required this.description});
}

final slideList = [
  Slide(
      imagePath: "assets/images/getting_started_slide_1.jpg",
      title: "Number 1",
      description: "Number 1 description"),
  Slide(
      imagePath: "assets/images/getting_started_slide_2.jpg",
      title: "Number 2",
      description: "Number 2 description"),
  Slide(
      imagePath: "assets/images/getting_started_slide_3.jpg",
      title: "Number 3",
      description: "Number 3 description"),
];
