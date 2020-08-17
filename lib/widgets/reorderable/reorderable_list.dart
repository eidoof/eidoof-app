


import 'dart:ui';

import 'package:eidoof/widgets/reorderable/reorderable_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';


class ReorderableList extends StatefulWidget {
  //Function callback;
  //NewRecipePage(this.callback);

  final Function() notifyParent;
  ReorderableList({Key key, @required this.notifyParent}) : super(key: key);

  @override
  _ReorderableList createState() => _ReorderableList();
}

class _ReorderableList extends State<ReorderableList> {
  List<Widget> _rows;
  var max_idx;



  @override
  void initState() {
    super.initState();
    _rows = List<Widget>();

    for (max_idx = 0; max_idx < 6; max_idx++) {
      _rows.add(Text("aaa"));
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_rows);
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _rows.removeAt(oldIndex);
        _rows.insert(newIndex, row);
      });
    }
    // Make sure there is a scroll controller attached to the scroll view that contains ReorderableSliverList.
    // Otherwise an error will be thrown.
    ScrollController _scrollController = PrimaryScrollController.of(context) ??
        ScrollController();

    return ImplicitlyAnimatedReorderableList<Widget>(
      items: _rows,
      onReorderStarted: (item, from) {
        print("triggered!");
        setState(() {
          widget.notifyParent();
        });
      },
      areItemsTheSame: (oldItem, newItem) => 0 == 0,
      onReorderFinished: (item, from, to, newItems) {
        // Remember to update the underlying data when the list has been
        // reordered.
        setState(() {
          widget.notifyParent();
          _rows
            ..clear()
            ..addAll(newItems);
        });
      },
      itemBuilder: (context, itemAnimation, item, index) {
        // Each item must be wrapped in a Reorderable widget.
        return ReorderableListItem(context, item, itemAnimation);
      },
      // Since version 0.2.0 you can also display a widget
      // before the reorderable items...
      header: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Center(
            child: Text("Preparation Steps",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 17
                      ))),
      ),
      // ...and after. Note that this feature - as the list itself - is still in beta!
      footer: Container(
      ),
      // If you want to use headers or footers, you should set shrinkWrap to true
      shrinkWrap: true,
    );
  }
}