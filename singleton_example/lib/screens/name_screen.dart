import 'package:flutter/material.dart';
import 'package:singleton_example/state/user_state_definition.dart';

class NameScreen extends StatelessWidget {
  final user = UserStateDefinition.getState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Center(
        child: Text(
          user.currentName,
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
