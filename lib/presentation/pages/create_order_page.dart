import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/service_locator.dart';
import '../controllers/order_controller.dart';
import '../widgets/create_order_view.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Создать заказ')),
      body: BlocProvider<OrderController>(
        create: (_) => sl<OrderController>(),
        child: const CreateOrderView(),
      ),
    );
  }
}
