


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'creation_aware_list_item.dart';
import 'home_viewmodel.dart';


//import 'package:provider/provider.dart';

import 'package:flutter/material.dart';




class FeedList extends StatefulWidget {

  @override
  _FeedList createState() => _FeedList();
}

class _FeedList extends State<FeedList>
    with AutomaticKeepAliveClientMixin {

  ScrollController _scrollController = new ScrollController();

  List<Widget> entries = [];


  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
  }
}