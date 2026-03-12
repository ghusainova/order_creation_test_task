import 'package:flutter_application_1/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Utility Functions', () {
    test('doubleValue should return double the input', () {
      expect(doubleValue(2), 4);
      expect(doubleValue(0), 0);
      expect(doubleValue(-1), -2);
    });

    test('getCounterText should return formatted text', () {
      expect(
        getCounterText(0),
        'You have pushed the button this many times: 0',
      );
      expect(
        getCounterText(5),
        'You have pushed the button this many times: 5',
      );
    });
  });
}
