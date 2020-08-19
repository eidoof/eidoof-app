





import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';


class ReorderableListItemContent extends StatefulWidget {

  var index;
  var content;

  final Function(int, String) notifyParent;
  ReorderableListItemContent(this.notifyParent, this.index, this.content);

  @override
  _ReorderableListItemContentState createState() => _ReorderableListItemContentState();



}


class _ReorderableListItemContentState extends State<ReorderableListItemContent> {


  var idx;
  var content;

  @override
  void initState() {

    idx = widget.index;
    content = widget.content;
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: EdgeInsets.all(10),

      child: Padding(
          padding: EdgeInsets.only(left:16.0),
          child: Row(
            children: [
              Container(
                //width: 50.0,
                //height: 50.0,
                padding: const EdgeInsets.all(20.0),//I used some padding without fixed width and height
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,// You can use like this way or like the below line
                  //borderRadius: new BorderRadius.circular(30.0),
                  color: Colors.green,
                ),
                child: new Text((idx+1).toString(), style: new TextStyle(color: Colors.white, fontSize: 20.0)),// You can add a Icon instead of text also, like below.
                //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
              ),
              Container(
                width: 280,
                child: TextFormField(
                  initialValue: (content != null) || (content != "") ? content : null,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'Mix everything in a big bowl!',
                  ),
                  onChanged: (String value) {
                    setState(() {
                      widget.content = value;
                      widget.notifyParent(idx, value);
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )
              ),
              Handle(
                delay: const Duration(milliseconds: 100),
                child: Icon(
                  Icons.menu,
                  color: Colors.grey,
                )
              )
            ],
          )
      ),
    );


    return Material(
      color: Colors.green,
      type: MaterialType.transparency,
      child: ListTile(
        title: Text("aaa"),
        // The child of a Handle can initialize a drag/reorder.
        // This could for example be an Icon or the whole item itself. You can
        // use the delay parameter to specify the duration for how long a pointer
        // must press the child, until it can be dragged.
        trailing: Handle(
          delay: const Duration(milliseconds: 100),
          child: Icon(
            Icons.menu,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}



Reorderable reorderableListItem(context, item, itemAnimation, index, func, valueItem) {
  return Reorderable(
    // Each item must have an unique key.
    key: ValueKey(valueItem),
    // The animation of the Reorderable builder can be used to
    // change to appearance of the item between dragged and normal
    // state. For example to add elevation when the item is being dragged.
    // This is not to be confused with the animation of the itemBuilder.
    // Implicit animations (like AnimatedContainer) are sadly not yet supported.
    builder: (context, dragAnimation, inDrag) {
      final t = dragAnimation.value;
      final elevation = lerpDouble(0, 8, t);
      final color = Color.lerp(
          Colors.white, Colors.white.withOpacity(0.8), t);

      return SizeFadeTransition(
        sizeFraction: 0.7,
        curve: Curves.easeInOut,
        animation: itemAnimation,
        child: new ReorderableListItemContent(func, index, item),
      );
    },
  );
}