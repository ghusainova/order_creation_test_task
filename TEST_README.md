# Flutter Application Tests

This project includes all types of Flutter tests: unit tests, widget tests, and integration tests.

## Running Tests

### Unit Tests
Unit tests test individual functions and classes.

```bash
flutter test test/unit_test.dart
```

### Widget Tests
Widget tests test Flutter widgets in isolation.

```bash
flutter test test/widget_test.dart
```

### Integration Tests
Integration tests test the entire app using flutter_driver. These require a device or emulator.

For Android/iOS device:
```bash
flutter drive --driver=test_driver/integration_driver.dart --target=lib/main.dart
```

For web (requires chromedriver):
```bash
chromedriver --port=4444
flutter drive --driver=test_driver/integration_driver.dart --target=lib/main.dart -d chrome
```

## Test Coverage

- **Unit Tests**: Test utility functions like `doubleValue` and `getCounterText`
- **Widget Tests**: Test UI components, counter increment, app title, floating action button
- **Integration Tests**: Test full app flow including counter interactions