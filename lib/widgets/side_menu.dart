import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  Function callback;

  SideMenu(this.callback);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  void openNewRecipe() {
    this.widget.callback("new_recipe");
  }

  void openProfile() {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'foodie',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            onTap: openNewRecipe,
            contentPadding: EdgeInsets.only(
              bottom: 30,
              left: 16,
              right: 16,
            ),
            leading: Icon(
              Icons.add_circle,
              color: Colors.green,
            ),
            title: Text('Add Recipe',
                style: TextStyle(
                  color: Colors.green,
                )),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.format_list_bulleted),
            title: Text('Feed'),
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Collections'),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(
              top: 170,
              left: 16,
              right: 16,
            ),
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
