import 'package:factory_method_example/android_alert_dialog.dart';
import 'package:factory_method_example/custom_dialog.dart';
import 'package:factory_method_example/ios_alert_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<CustomDialog> dialogs = [AndroidAlertDialog(), IosAlertDialog()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Android alert dialog'),
              onPressed: () => dialogs[0].show(context),
            ),
            RaisedButton(
              child: Text('iOS alert dialog'),
              onPressed: () => dialogs[1].show(context),
            ),
          ],
        ),
      ),
    );
  }
}
