import 'package:flutter/material.dart';
import 'package:strategy_example/models/order.dart';
import 'package:strategy_example/strategy/ishipping_costs_strategy.dart';
import 'package:strategy_example/strategy/strategies/in_store_pickup_strategy.dart';
import 'package:strategy_example/strategy/strategies/parcel_terminal_shipping_streategy.dart';
import 'package:strategy_example/strategy/strategies/priority_shipping_strategy.dart';
import 'package:strategy_example/strategy/strategies/sedex_shipping_strategy.dart';
import 'package:strategy_example/widgets/order_buttons/order_buttons.dart';
import 'package:strategy_example/widgets/order_itens_table.dart';
import 'package:strategy_example/widgets/order_summary/order_summary.dart';
import 'package:strategy_example/widgets/shipping_options.dart';

class StrategyExample extends StatefulWidget {
  @override
  _StrategyExampleState createState() => _StrategyExampleState();
}

class _StrategyExampleState extends State<StrategyExample> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy(),
    SedexShippingStrategy()
  ];
  int _selectedStrategyIndex = 0;
  Order _order = Order();

  void _addToOrder() {
    setState(() {
      _order.addOrderItem(OrderItem.random());
    });
  }

  void _clearOrder() {
    setState(() {
      _order = Order();
    });
  }

  void _setSelectedStrategyIndex(int index) {
    setState(() {
      _selectedStrategyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              OrderButtons(
                onAdd: _addToOrder,
                onClear: _clearOrder,
              ),
              const SizedBox(height: 24),
              Stack(
                children: <Widget>[
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _order.items.isEmpty ? 1.0 : 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Your order is empty',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _order.items.isEmpty ? 0.0 : 1.0,
                    child: Column(
                      children: <Widget>[
                        OrderItemsTable(
                          orderItems: _order.items,
                        ),
                        const SizedBox(height: 24),
                        ShippingOptions(
                          selectedIndex: _selectedStrategyIndex,
                          shippingOptions: _shippingCostsStrategyList,
                          onChanged: _setSelectedStrategyIndex,
                        ),
                        OrderSummary(
                          shippingCostsStrategy: _shippingCostsStrategyList[
                              _selectedStrategyIndex],
                          order: _order,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
