# Order Creation Test Task

A small Flutter test task that implements an order creation flow using a REST API.

## Features

- Create order request (`POST /api/orders`)
- Order model with `fromJson`
- Custom `ApiException` for error handling
- `createOrder` method with:
  - async/await
  - HTTP status handling
  - timeout (10 seconds)
  - network error handling
- `OrderController` with states:
  - initial
  - loading
  - success
  - error
- UI with:
  - "Create Order" button
  - loading indicator
  - error message display
  - retry after failure

## Project Structure

```
lib/
├── data/
│   └── order_api.dart
├── models/
│   └── order.dart
├── controllers/
│   └── order_controller.dart
├── exceptions/
│   └── api_exception.dart
└── ui/
    └── create_order_screen.dart
```

## Running the Project

```
flutter pub get
flutter run
```