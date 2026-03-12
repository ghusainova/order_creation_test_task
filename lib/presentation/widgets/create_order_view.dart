import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/blocs/order/order_bloc.dart';
import 'package:flutter_application_1/presentation/blocs/order/order_event.dart';
import 'package:flutter_application_1/presentation/blocs/order/order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state is OrderLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: state is OrderLoading
                      ? null
                      : () => context.read<OrderBloc>().add(
                          const SubmitOrderEvent(1, 1),
                        ),
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
    );
  }
}
