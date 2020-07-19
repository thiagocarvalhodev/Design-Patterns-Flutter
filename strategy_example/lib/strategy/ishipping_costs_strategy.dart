import 'package:strategy_example/models/order.dart';

abstract class IShippingCostsStrategy {
  String label;
  double calculate(Order order);
}
