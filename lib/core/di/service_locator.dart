import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/order_remote_data_source.dart';
import '../../data/repositories/order_repository_impl.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/usecases/create_order.dart';
import '../../presentation/controllers/order_controller.dart';

final GetIt sl = GetIt.instance;

void setupDependencies() {
  // Core
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://your-api-base-url.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    ),
  );

  // Data sources
  sl.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSource(
      sl<Dio>(),
      baseUrl: sl<Dio>().options.baseUrl,
    ),
  );

  // Repositories
  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(sl<OrderRemoteDataSource>()),
  );

  // Use cases
  sl.registerFactory<CreateOrder>(
    () => CreateOrder(sl<OrderRepository>()),
  );

  // Controllers
  sl.registerFactory<OrderController>(
    () => OrderController(sl<CreateOrder>()),
  );
}

