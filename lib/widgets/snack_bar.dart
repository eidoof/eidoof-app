import "package:flutter/material.dart";

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> displaySnackBar(
    BuildContext context, String text) {
  return Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
}
