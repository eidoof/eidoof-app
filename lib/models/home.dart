import 'package:flutter/widgets.dart';

class HomeModel extends ChangeNotifier {
  List<String> _items;
  List<String> get items => _items;

  HomeModel() {
    _items = List<String>.generate(15, (index) => 'Title $index');
  }
}
