import 'package:factory_method_example/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// Concrete Creator to iOS

class IosAlertDialog extends CustomDialog {
  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTile()),
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
    return 'iOS alert dialog';
  }
}
