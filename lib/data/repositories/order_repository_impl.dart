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
      } else if (e.response != null) {
        final statusCode = e.response!.statusCode ?? 0;

        if (statusCode >= 400) {
          final data = e.response!.data;
          final backendMessage =
              (data is Map<String, dynamic>) ? data['message'] : null;

          final message =
              (backendMessage is String && backendMessage.isNotEmpty)
                  ? backendMessage
                  : statusCode >= 500
                      ? 'Server error, please try again later'
                      : 'Request failed';

          throw ApiException(message);
        }
      }
      throw ApiException('Unknown error occurred');
    } catch (e) {
      throw ApiException('Unknown error occurred');
    }
  }
}
