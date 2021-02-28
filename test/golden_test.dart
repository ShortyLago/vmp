import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:Lodicak/screens/home_page.dart';
import 'devices.dart';

// After this test is done see folder test/goldens/ for screenshots

void main() {
  testGoldens('HomeScreen', (tester) async {
    final homeScreen = HomePage();

    await tester.pumpWidgetBuilder(
      homeScreen,
    );

    await multiScreenGolden(
      tester,
      'home_screen',
      devices: devicesWithDifferentTextScales,
    );
  });
}