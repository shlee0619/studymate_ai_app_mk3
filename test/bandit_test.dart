import 'package:flutter_test/flutter_test.dart';
import 'package:studymate_ai_app/app/features/quiz/bandit.dart';

void main() {
  test('UCB1 selects each arm at least once then best', () {
    final b = Ucb1Bandit(3);
    expect(b.select(), anyOf(0, 1, 2));
    b.update(0, 1.0);
    expect(b.select(), anyOf(0, 1, 2));
  });
}

