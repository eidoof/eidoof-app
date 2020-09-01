import 'package:flutter/material.dart';





void popupSearch(context) {



  showDialog(
    context: context,
    builder: (_) => SearchPopup(),
  );
}


class SearchPopup extends StatefulWidget {

  SearchPopup();

  @override
  _SearchPopupState createState() => _SearchPopupState();
}

class _SearchPopupState extends State<SearchPopup> {



  var keyword = "";
  var dropdownValue = "";
  var teamName = "";


  DropdownButton<String> filterDropdown(List<String> choices) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
          color: Colors.deepPurple
      ),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: choices
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    )
  } 

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Enter current team'),
        content: new Row(
          children: <Widget>[
            new Expanded(
            child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Search',
                  hintText: 'eg. Pasta'),
              onChanged: (value) {
                keyword = value;
              },
              onSubmitted: (value) {
                // TODO: send search request, load results screen.
              },
            )),
            new Expanded(
              child: filterDropdown(["a", "b", "c"])
            ),
          ],

  ),
  actions: <Widget>[
  FlatButton(
  child: Text('Ok'),
  onPressed: () {
  Navigator.of(context).pop(teamName);
  },
  ),
  ],
  );

}
