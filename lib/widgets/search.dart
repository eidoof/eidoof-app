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

  var sliderValues = new Map();
  var dropdownValues = new Map();



  @override
  void initState() {
    super.initState();
    sliderValues["price"] = 0;
  }

  Slider customSlider(String key) {


    return Slider(
      value: sliderValues[key],
      min: 0.01,
      max: 100,
      divisions: 5,
      label: sliderValues[key].round().toString() + ((sliderValues[key] == 100) ? ("+ \$") : (" \$")),
      onChanged: (double value) {
        setState(() {
          sliderValues[key] = value;
        });
      },
    );
  }

  DropdownButton<String> filterDropdown(String title, String key, List<String> choices) {
    return new DropdownButton<String>(
      value: dropdownValues[key],
      hint: Text(title),
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
          dropdownValues[key] = newValue;
        });
      },
      items: choices
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Search'),
      content: new Column(
        children: <Widget>[
          new Expanded(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'keywords',
                    hintText: 'eg. Pasta'),
                onChanged: (value) {
                  keyword = value;
                },
                onSubmitted: (value) {
                  // TODO: send search request, load results screen.
                },
              )),
          new Expanded(
            child:  new Row(
              children: [
                filterDropdown("Minimum Rating", "ratings", ["⭐", "⭐⭐", "⭐⭐⭐", "⭐⭐⭐⭐", "⭐⭐⭐⭐⭐"]),
                filterDropdown("Order", "order", ["Desc", "Asc"]),
              ],
            )
          ),
          new Expanded(
            child: filterDropdown("Spicyness", "spice", ["Spicy", "Non-Spicy"]),
          ),
          new Expanded(
            // TODO: Potential useful library: https://flutterawesome.com/an-extension-of-the-flutter-material-slider/
            child: customSlider("price"),
          )
        ],

      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop("REEEEE");
          },
        ),
      ],
    );
  }
}