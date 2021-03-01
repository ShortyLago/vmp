import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// For run this test suite run this in terminal
// flutter drive --target=test/test_driver/app.dart

void main() {
  group('Testing App Performance Tests', () {
    final titleText = find.byValueKey('title');
    final text1 = find.byValueKey('text_1');
    final text2 = find.byValueKey('text_2');
    final text3 = find.byValueKey('text_3');
    final text4 = find.byValueKey('text_4');
    final text5 = find.byValueKey('text_5');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('home_page tests', () async {
      expect(await driver.getText(titleText), 'Vodca malého plavidla');
      expect(await driver.getText(text1), 'Vyberte kategóriu testu:');
      expect(await driver.getText(text2), 'Vodca malého plavidla kategórie A');
      expect(await driver.getText(text3), 'Vodca malého plavidla kategórie B');
      expect(await driver.getText(text4), 'Vodca malého plavidla kategórie C');
      expect(await driver.getText(text5), 'Vodca malého plavidla kategórie D');
      // await driver.tap(text3);
    });
  });
}