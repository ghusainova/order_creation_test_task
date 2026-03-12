import '../repositories/order_repository.dart';
import '../entities/order.dart';

class CreateOrder {
  final OrderRepository repository;

  CreateOrder(this.repository);

  Future<Order> call(int userId, int serviceId) async {
    return await repository.createOrder(userId, serviceId);
  }
}
