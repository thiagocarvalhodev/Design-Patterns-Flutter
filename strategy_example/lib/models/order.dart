import 'package:faker/faker.dart';

class Order {
  final List<OrderItem> items = List<OrderItem>();

  double get price =>
      items.fold(0.0, (sum, orderItem) => sum + orderItem.price);

  void addOrderItem(OrderItem orderItem) {
    items.add(orderItem);
  }
}

class OrderItem {
  String title;
  double price;
  PackageSize packageSize;

  OrderItem.random() {
    var packageSizeList = PackageSize.values;
    var faker = new Faker();

    title = faker.lorem.word();
    price = random.integer(100, min: 5) - 0.01;
    packageSize = packageSizeList[random.integer(packageSizeList.length)];
  }
}

enum PackageSize {
  S,
  M,
  L,
  XL,
}
