import 'package:dio/dio.dart';
import 'dart:io';
import '../../domain/repositories/order_repository.dart';
import '../../domain/entities/order.dart';
import '../../core/exceptions/api_exception.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<Order> createOrder(int userId, int serviceId) async {
    try {
      // temporary test delay to observe loading UI.
      // await Future.delayed(const Duration(seconds: 2));

      final response = await remoteDataSource
          .createOrder({'userId': userId, 'serviceId': serviceId})
          .timeout(const Duration(seconds: 10));

      return response;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw ApiException('No internet connection');
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw ApiException('Request timeout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw ApiException('No internet connection');
      } else if (e.response != null && (e.response!.statusCode ?? 0) >= 400) {
        final data = e.response!.data;
        final message = (data is Map<String, dynamic>) ? data['message'] : null;
        throw ApiException(
          (message is String && message.isNotEmpty)
              ? message
              : 'Request failed',
        );
      } else {
        throw ApiException('Unknown error occurred');
      }
    } catch (e) {
      throw ApiException('Unknown error occurred');
    }
  }
}
