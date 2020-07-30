import "package:flutter/material.dart";
import "package:eidoof/widgets/feed/feed_list.dart";
import "package:eidoof/screens/new_recipe_page.dart";
import "package:eidoof/widgets/side_menu.dart";
import "package:eidoof/widgets/app_bar.dart";
import "package:eidoof/models/user.dart";

class Home extends StatefulWidget {
  static const String route = "/";

  final UserModel user;
  Home({Key key, @required this.user}) : super(key: key);

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
      "feed": FeedList(),
      "new_recipe": NewRecipePage(),
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
