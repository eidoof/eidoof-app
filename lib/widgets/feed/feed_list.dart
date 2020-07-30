import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'feed_item.dart';

class FeedList extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  List<String> imageList = new List();

  ScrollController _scroll = new ScrollController();

  _fetchData() async {
    final response =
        await http.get("https://api.thecatapi.com/v1/images/search");
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)[0]['url']);
      setState(() {
        imageList.add(jsonDecode(response.body)[0]['url']);
      });
    } else {
      print("Gagal");
    }
  }

  _fetchDataEnam() {
    for (var i = 0; i < 6; i++) {
      _fetchData();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDataEnam();

    _scroll.addListener(() {
      if (_scroll.position.pixels == _scroll.position.maxScrollExtent) {
        _fetchDataEnam();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scroll,
      itemCount: imageList.length,
      itemBuilder: (context, i) {
        return feedItem(context, i, imageList);
      },
    );
  }
}

