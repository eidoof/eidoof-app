import "package:flutter/material.dart";
import "package:email_validator/email_validator.dart";
import "package:eidoof/models/user_in_login.dart";
import "package:eidoof/services/api_client.dart";

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Email",
                  labelText: "Email *"),
              validator: (String value) => EmailValidator.validate(value)
                  ? null
                  : "Please enter a valid email address.",
              onSaved: (String value) => _email = value),
          TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                  labelText: "Password *"),
              obscureText: true,
              validator: (String value) => (value.length < 8)
                  ? "Password must be 8 or more characters."
                  : null,
              onSaved: (String value) => _password = value),
          SizedBox(height: 12.0),
          FlatButton(
              child:
                  Text("Login", style: Theme.of(context).textTheme.subtitle1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Logging in...")));
                  _formKey.currentState.save();
                  // TODO Better error handling
                  login(UserInLoginModel(_email, _password))
                      .then((user) => print(user))
                      .catchError((err) => print(err));
                }
              }),
        ]));
  }
}
