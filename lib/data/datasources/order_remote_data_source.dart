import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/entities/order.dart';

part 'order_remote_data_source.g.dart';

@RestApi()
abstract class OrderRemoteDataSource {
  factory OrderRemoteDataSource(Dio dio, {String baseUrl}) =
      _OrderRemoteDataSource;

  @POST('/api/orders')
  Future<Order> createOrder(@Body() Map<String, dynamic> body);
}
