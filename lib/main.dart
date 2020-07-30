import 'dart:convert';

import 'package:eidooffrontend/pages/new_recipe_page.dart';
import 'package:eidooffrontend/sidemenu/sidemenu.dart';
import 'package:eidooffrontend/topbar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'feed/feed_list.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Widget currentPage;
  Map pages;

  @override
  void initState() {
    super.initState();

    pages = {
      "feed"       : FeedList(),
      "new_recipe" : NewRecipePage(),
    };

    currentPage = pages["feed"];
  }

  callback(whichPage) {
    print("callback triggered!");
    setState(() {
      currentPage = this.pages[whichPage];
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: generateBar(),
      body: currentPage,
      drawer: SideMenu(callback),
    );
  }
}