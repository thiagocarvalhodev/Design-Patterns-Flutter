import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Creator class
abstract class CustomDialog {
  String getTile();

  // Method to create objects
  Widget create(BuildContext context);

  Future<void> show(BuildContext context) {
    var dialog = create(context);

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext _) => dialog);
  }
}
