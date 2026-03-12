## Order creation test task (Flutter)

Implementation of a small test task: creating an order via REST API with proper error handling and state management.

### What is implemented

- `Order` model (`lib/domain/entities/order.dart`) with `fromJson` and correct snake_case ↔ camelCase mapping:
  - `order_id` → `orderId`
  - `payment_url` → `paymentUrl`
- `ApiException` (`lib/core/exceptions/api_exception.dart`) as a custom error type.
- `createOrder` flow:
  - `OrderRemoteDataSource` (`lib/data/datasources/order_remote_data_source.dart`) using Dio + Retrofit
  - `OrderRepositoryImpl` (`lib/data/repositories/order_repository_impl.dart`) with:
    - async/await
    - timeout (10 seconds)
    - HTTP 400+ handling
    - network error handling
    - mapping all failures to `ApiException`
- `OrderCubit` (`lib/presentation/controllers/order_controller.dart`) with states (`lib/presentation/controllers/order_controller_state.dart`):
  - `OrderInitial`
  - `OrderLoading`
  - `OrderSuccess`
  - `OrderError`
- UI:
  - `CreateOrderPage` (`lib/presentation/pages/create_order_page.dart`)
  - `CreateOrderView` (`lib/presentation/widgets/create_order_view.dart`)
  - "Создать заказ" button
  - loading indicator and disabled button during request
  - error message with retry by pressing the button again
  - success state displaying order id, status and payment URL (if present)

### Notes about API

- The base URL is configured in `lib/core/di/service_locator.dart` as a placeholder:
  - `https://your-api-base-url.com`
- For real integration it should be replaced with the actual backend URL, or the data layer can be mocked.

### How to run

```bash
flutter pub get
flutter run
```