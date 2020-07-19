import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:strategy_example/models/order.dart';

class OrderItemsTable extends StatelessWidget {
  final List<OrderItem> orderItems;

  const OrderItemsTable({
    @required this.orderItems,
  }) : assert(orderItems != null);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 32,
      horizontalMargin: 24,
      headingRowHeight: 24,
      dataRowHeight: 24,
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            'Title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Package Size',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Price',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
          numeric: true,
        ),
      ],
      rows: <DataRow>[
        for (var orderItem in orderItems)
          DataRow(
            cells: <DataCell>[
              DataCell(Text(orderItem.title)),
              DataCell(Text(orderItem.packageSize.toString().split('.').last)),
              DataCell(Text('\$${orderItem.price.toStringAsFixed(2)}')),
            ],
          ),
      ],
    );
  }
}
