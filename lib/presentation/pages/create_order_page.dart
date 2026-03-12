import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/order_controller.dart';
import '../controllers/order_controller_state.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Создать заказ')),
      body: const CreateOrderView(),
    );
  }
}

class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider<OrderController>(
        create: (_) => sl<OrderController>(),
        child: BlocBuilder<OrderController, OrderControllerState>(
          builder: (context, state) {
            final isLoading = state is OrderLoading;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () =>
                              context.read<OrderController>().submitOrder(1, 1),
                    child: const Text('Создать заказ'),
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
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Заказ создан успешно!',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
