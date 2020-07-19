import 'package:strategy_example/models/order.dart';
import 'package:strategy_example/strategy/ishipping_costs_strategy.dart';

class SedexShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Sedex shipping';

  @override
  double calculate(Order order) {
    return order.items.fold(
        0.0, (sum, orderItem) => sum += _getOrderItemShippingPrice(orderItem));
  }

  double _getOrderItemShippingPrice(OrderItem orderItem) {
    switch (orderItem.packageSize) {
      case PackageSize.S:
        return 3.99;
      case PackageSize.M:
        return 5.49;
      case PackageSize.L:
        return 7.99;
      case PackageSize.XL:
        return 10.49;
      default:
        throw new Exception(
            "Unknown shipping price for the package of size '${orderItem.packageSize}'.");
    }
  }
}
