import '../entities/order.dart';

abstract class OrderRepository {
  Future<Order> createOrder(int userId, int serviceId);
}
