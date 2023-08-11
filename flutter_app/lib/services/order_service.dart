import 'package:flutter_app/models/order.dart';

class OrderService {
  List<Order> _orders = [];

  List<Order> getOrders() {
    return _orders;
  }

  void addOrder(Order order) {
    _orders.add(order);
  }

  void removeOrder(Order order) {
    _orders.remove(order);
  }

  Order findOrderById(String id) {
    return _orders.firstWhere((order) => order.id == id);
  }
}