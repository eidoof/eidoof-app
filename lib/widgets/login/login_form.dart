import "package:flutter/material.dart";
import "package:email_validator/email_validator.dart";
import "package:eidoof/models/user.dart";
import "package:eidoof/services/api_client.dart";

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "Email",
                      labelText: "Email *"),
                  validator: (String value) => EmailValidator.validate(value)
                      ? null
                      : "Please enter a valid email address."),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: "Password",
                    labelText: "Password *"),
                obscureText: true,
                validator: (String value) => (value.length < 8)
                    ? "Password must be 8 or more characters."
                    : null,
              ),
              SizedBox(height: 12.0),
              FlatButton(
                  child: Text("Login",
                      style: Theme.of(context).textTheme.subtitle1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Logging in...")));
                      // TODO Better error handling
                      login(UserInLoginModel(_email.text, _password.text))
                          .then((user) => print(user))
                          .catchError((err) => print(err));
                    }
                  }),
            ]))));
  }
}
