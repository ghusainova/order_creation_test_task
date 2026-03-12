import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class SubmitOrderEvent extends OrderEvent {
  final int userId;
  final int serviceId;

  const SubmitOrderEvent(this.userId, this.serviceId);

  @override
  List<Object> get props => [userId, serviceId];
}
