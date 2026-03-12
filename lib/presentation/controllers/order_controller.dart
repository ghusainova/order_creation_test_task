import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exceptions/api_exception.dart';
import '../../domain/usecases/create_order.dart';
import 'order_controller_state.dart';

class OrderController extends Cubit<OrderControllerState> {
  final CreateOrder createOrder;

  OrderController(this.createOrder) : super(const OrderInitial());

  Future<void> submitOrder(int userId, int serviceId) async {
    emit(const OrderLoading());
    try {
      final order = await createOrder(userId, serviceId);
      emit(OrderSuccess(order));
    } on ApiException catch (e) {
      emit(OrderError(e.message));
    } catch (_) {
      emit(const OrderError('Unknown error occurred'));
    }
  }
}

