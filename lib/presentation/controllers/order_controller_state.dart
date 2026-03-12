import 'package:equatable/equatable.dart';

import '../../domain/entities/order.dart';

abstract class OrderControllerState extends Equatable {
  const OrderControllerState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderControllerState {
  const OrderInitial();
}

class OrderLoading extends OrderControllerState {
  const OrderLoading();
}

class OrderSuccess extends OrderControllerState {
  final Order order;

  const OrderSuccess(this.order);

  @override
  List<Object?> get props => [order];
}

class OrderError extends OrderControllerState {
  final String message;

  const OrderError(this.message);

  @override
  List<Object?> get props => [message];
}

