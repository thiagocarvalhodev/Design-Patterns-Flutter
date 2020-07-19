import 'package:flutter/material.dart';

import 'screens/strategy_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: StrategyExample());
  }
}
