import 'package:strategy_example/models/order.dart';
import 'package:strategy_example/strategy/ishipping_costs_strategy.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Priority shipping';

  @override
  double calculate(Order order) {
    return 9.99;
  }
}
