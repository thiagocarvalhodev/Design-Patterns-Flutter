import 'package:strategy_example/models/order.dart';
import 'package:strategy_example/strategy/ishipping_costs_strategy.dart';

/// O produto está na loja. Logo o frete é 0 .
class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String label = 'In-store pickup';

  @override
  double calculate(Order order) {
    return 0.0;
  }
}
