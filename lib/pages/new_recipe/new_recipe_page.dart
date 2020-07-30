






import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:image_picker/image_picker.dart';


class NewRecipePage extends StatefulWidget {

  //Function callback;

  //NewRecipePage(this.callback);

  @override
  _NewRecipePageState createState() => _NewRecipePageState();
}



class _NewRecipePageState extends State<NewRecipePage> {

  File _image;
  final picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  Future getImage(src) async {
    final pickedFile = await picker.getImage(source: src == "camera" ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                _image == null ? Image.asset(
                  'assets/green.png',
                  height: 300,
                  width: 900,
                ) : Image.file(_image),
                Center(
                  child: Row(
                children: <Widget> [
                  GestureDetector(
                    onTap: () {
                    getImage("library");
                    },
                    child:Opacity(
                      opacity: 0.8,
                      child: Icon(
                        Icons.photo_library,
                        size: 100,
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getImage("camera");
                    },
                    child:Opacity(
                        opacity: 0.8,
                        child: Icon(
                          Icons.camera_alt,
                          size: 100,
                        )
                    ),
                  )
                ],
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally
                      crossAxisAlignment: CrossAxisAlignment.center //Center Row contents vertically,,
                  )

                )

              ]
          )),
          TextFormField(
            inputFormatters: [
              new LengthLimitingTextInputFormatter(50),
            ],
            decoration: const InputDecoration(
              hintText: '   Title',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 6,
            decoration: const InputDecoration(
              hintText: '   Description',

            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Center(
            child: Padding(
            padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,
                left: 16.0,
                right: 16.0),
            child: RaisedButton(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 90,
                right: 90
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.lightGreen),
              ),
              color: Colors.lightGreen,
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  print("SUBMIT!");
                }
              },
              child: Text(
                  'PUBLISH',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  ),
            ),
          )
          ),
        ],
      ),
    );
  }
}
