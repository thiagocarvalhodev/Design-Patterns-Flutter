import 'package:flutter/material.dart';
import 'package:singleton_example/app.dart';
import 'package:singleton_example/screens/name_screen.dart';
import 'package:singleton_example/state/user_state_definition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserStateDefinition user = UserStateDefinition.getState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  user.currentName,
                  style: TextStyle(fontSize: 32),
                ),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      user.onChangeName(text);
                    });
                  },
                ),
                RaisedButton(
                  child: Text('Reset name'),
                  onPressed: () => setState(() => user.resetName()),
                ),
                RaisedButton(
                  child: Text('Show name!'),
                  onPressed: () => navigatorKey.currentState.push(
                      MaterialPageRoute(builder: (context) => NameScreen())),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
