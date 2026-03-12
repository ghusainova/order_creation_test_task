import 'package:flutter_test/flutter_test.dart';

import 'package:order_creation_test_task/core/exceptions/api_exception.dart';
import 'package:order_creation_test_task/domain/entities/order.dart';
import 'package:order_creation_test_task/domain/repositories/order_repository.dart';
import 'package:order_creation_test_task/domain/usecases/create_order.dart';
import 'package:order_creation_test_task/presentation/controllers/order_controller.dart';
import 'package:order_creation_test_task/presentation/controllers/order_controller_state.dart';

class _SuccessOrderRepository implements OrderRepository {
  @override
  Future<Order> createOrder(int userId, int serviceId) async {
    return const Order(
      orderId: 123,
      status: 'created',
      paymentUrl: 'https://example.com/pay/123',
    );
  }
}

class _ErrorOrderRepository implements OrderRepository {
  @override
  Future<Order> createOrder(int userId, int serviceId) async {
    throw ApiException('No internet connection');
  }
}

void main() {
  group('OrderController', () {
    test('emits [loading, success] on successful submitOrder', () async {
      final cubit = OrderController(CreateOrder(_SuccessOrderRepository()));

      final states = <OrderState>[];
      final sub = cubit.stream.listen(states.add);

      await cubit.submitOrder(1, 1);

      await sub.cancel();
      expect(states, [isA<OrderLoading>(), isA<OrderSuccess>()]);
    });

    test('emits [loading, error] on ApiException', () async {
      final cubit = OrderController(CreateOrder(_ErrorOrderRepository()));

      final states = <OrderState>[];
      final sub = cubit.stream.listen(states.add);

      await cubit.submitOrder(1, 1);

      await sub.cancel();
      expect(states, [isA<OrderLoading>(), isA<OrderError>()]);
    });
  });
}
