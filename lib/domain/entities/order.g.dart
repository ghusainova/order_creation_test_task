// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  orderId: (json['orderId'] as num).toInt(),
  status: json['status'] as String,
  paymentUrl: json['paymentUrl'] as String?,
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'orderId': instance.orderId,
  'status': instance.status,
  'paymentUrl': instance.paymentUrl,
};
