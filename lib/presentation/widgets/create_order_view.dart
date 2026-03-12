import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/order_controller.dart';
import '../controllers/order_controller_state.dart';

class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<OrderController, OrderState>(
        builder: (context, state) {
          final isLoading = state is OrderLoading;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading) const CircularProgressIndicator(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () => context.read<OrderController>().submitOrder(1, 1),
                child: isLoading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Создать заказ'),
              ),
              if (state is OrderError)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              if (state is OrderSuccess)
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Заказ создан успешно!',
                        style: TextStyle(color: Colors.green),
                      ),
                      const SizedBox(height: 8),
                      Text('ID заказа: ${state.order.orderId}'),
                      Text('Статус: ${state.order.status}'),
                      if (state.order.paymentUrl != null)
                        Text('Payment URL: ${state.order.paymentUrl}'),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
