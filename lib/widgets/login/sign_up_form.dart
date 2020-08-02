import "package:flutter/material.dart";
import "package:email_validator/email_validator.dart";
import "package:eidoof/models/user.dart";
import "package:eidoof/services/api_client.dart";

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: "Email",
                        labelText: "Email *"),
                    validator: (String value) => EmailValidator.validate(value)
                        ? null
                        : "Please enter a valid email address.",
                  ),
                  TextFormField(
                      controller: _username,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "Username",
                          labelText: "Username *"),
                      validator: (String value) {
                        // TODO Implement validation for username
                        return null;
                      }),
                  TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: "Password",
                          labelText: "Password *"),
                      obscureText: true,
                      validator: (String value) => (value.length < 8)
                          ? "Password must be 8 or more characters."
                          : null),
                  TextFormField(
                      controller: _confirmPassword,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: "Confirm password",
                          labelText: "Confirm password *"),
                      obscureText: true,
                      validator: (String value) => value == _password.text
                          ? null
                          : "Password does not match"),
                  SizedBox(height: 12.0),
                  FlatButton(
                      child: Text("Sign up",
                          style: Theme.of(context).textTheme.subtitle1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("Signing up...")));
                          // TODO Better error handling
                          register(UserInRegisterModel(
                                  _email.text, _username.text, _password.text))
                              .whenComplete(() => Scaffold.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                          "Check your email for verification"))))
                              .catchError((err) => print(err));
                        }
                      }),
                ]))));
  }
}
