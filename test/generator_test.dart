import 'package:Lodicak/questions/generator.dart';
import 'package:test/test.dart';

void main() {
  group('App basic calculations', () {
    var generator = Generator(quizType: 1);

    test('Generate test', () {
      expect(generator.questionPossition(), '1/7');
      expect(generator.isFinished(), false);
      expect(generator.getMinimum(), '6');

    });
  });
}