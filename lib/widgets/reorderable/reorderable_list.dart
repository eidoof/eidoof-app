


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
  List<String> _steps;
  var max_idx;



  @override
  void initState() {
    super.initState();
    _rows = List<Widget>();
    _steps = List<String>();

    for (max_idx = 0; max_idx < 2; max_idx++) {
      var elem = new Text("");
      _rows.add(elem);
      _steps.add("");
    }
  }

  void updateText(idx, text) {
    setState(() {
      _steps[idx] = text;
      print(idx);
      print(text);
      print("-----");
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(_rows);
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {

        Widget row = _rows.removeAt(oldIndex);
        _rows.insert(newIndex, row);

        String str = _steps.removeAt(oldIndex);
        _steps.insert(newIndex, str);

      });
    }
    // Make sure there is a scroll controller attached to the scroll view that contains ReorderableSliverList.
    // Otherwise an error will be thrown.
    ScrollController _scrollController = PrimaryScrollController.of(context) ??
        ScrollController();


    for (var i=0; i<_rows.length; i++) {
      if(_steps[i] == "button") {
        _steps.removeAt(i);
        _rows.removeAt(i);
      }
    }

    _rows.add(new Text("button"));
    _steps.add("button");

    return ImplicitlyAnimatedReorderableList<Widget>(
      items: _rows,
      onReorderStarted: (item, from) {
        setState(() {
          //print("DISABLED");
          widget.notifyParent();
        });
      },
      areItemsTheSame: (oldItem, newItem) => 0 == 0,
      onReorderFinished: (item, from, to, newItems) {
        // Remember to update the underlying data when the list has been
        // reordered.
        _onReorder(from, to);
        setState(() {
          //print("ENABLED");
          widget.notifyParent();
          _rows
            ..clear()
            ..addAll(newItems);
        });
      },
      itemBuilder: (context, itemAnimation, item, index) {
        // Each item must be wrapped in a Reorderable widget.
        if (_steps[index] == "button") {
         return Reorderable(
             key: ValueKey(_steps[index]),
             child: Padding(
               padding: EdgeInsets.only(left: 30.0, right: 30.0),
               child: RaisedButton(
                 textColor: Colors.white,
                 color: Colors.green,
                 child: Text("+ Add Step"),
                 onPressed: () {
                   setState(() {
                     _rows.add(new Text(""));
                     _steps.add("");
                   });
                 },
                 shape: new RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(30.0),
                 ),
               ),
             )
          );
        }
        else {
          return reorderableListItem(context, _steps[index], itemAnimation, index, updateText, item);
        }
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