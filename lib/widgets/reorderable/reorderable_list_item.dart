





import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';


class ReorderableListItemContent extends StatefulWidget {

  //ReorderableListItemContent(this.context, this.item, this.itemAnimation);

  @override
  _ReorderableListItemContentState createState() => _ReorderableListItemContentState();
}


class _ReorderableListItemContentState extends State<ReorderableListItemContent> {


  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: EdgeInsets.all(10),

      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              FlutterLogo(),
              Container(
                width: 300,
                child: Text("aaaaaaaaaaaaaaaaaaaaaaa\na\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
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



Reorderable reorderableListItem(context, item, itemAnimation) {
  return Reorderable(
    // Each item must have an unique key.
    key: ValueKey(item),
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
        child: ReorderableListItemContent(),
      );
    },
  );
}