import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/create_order.dart';
import '../../../core/exceptions/api_exception.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CreateOrder createOrder;

  OrderBloc(this.createOrder) : super(OrderInitial()) {
    on<SubmitOrderEvent>(_onSubmitOrder);
  }

  Future<void> _onSubmitOrder(
    SubmitOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      final order = await createOrder(event.userId, event.serviceId);
      emit(OrderSuccess(order));
    } on ApiException catch (e) {
      emit(OrderError(e.message));
    } catch (e) {
      emit(OrderError('Unknown error occurred'));
    }
  }
}
