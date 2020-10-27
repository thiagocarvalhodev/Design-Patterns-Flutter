import 'package:factory_method_example/custom_dialog.dart';
import 'package:flutter/material.dart';

// Concrete Creator to Android

class AndroidAlertDialog extends CustomDialog {
  @override
  Widget create(BuildContext context) {
    return AlertDialog(
      title: Text(getTile()),
      content: Text('Android alert dialog'),
      actions: <Widget>[
        FlatButton(
          child: Text('Fechar'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }

  @override
  String getTile() {
    return 'Android dialog';
  }
}
