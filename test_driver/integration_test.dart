import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App Integration Tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('starts at 0', () async {
      expect(await driver.getText(find.text('0')), '0');
    });

    test('increments the counter', () async {
      await driver.tap(find.byType('FloatingActionButton'));
      expect(await driver.getText(find.text('1')), '1');
    });

    test('increments multiple times', () async {
      await driver.tap(find.byType('FloatingActionButton'));
      expect(await driver.getText(find.text('2')), '2');

      await driver.tap(find.byType('FloatingActionButton'));
      expect(await driver.getText(find.text('3')), '3');
    });
  });
}