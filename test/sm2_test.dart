import 'package:flutter_test/flutter_test.dart';
import 'package:studymate_ai_app/app/features/review/sm2.dart';

void main() {
  test('SM-2 update increases interval on correct', () {
    final p = Sm2Params();
    final u1 = sm2Update(p, true, 0.8, 1200);
    expect(u1.intervalDays, greaterThanOrEqualTo(1));
    final p2 = Sm2Params(ef: u1.ef, intervalDays: u1.intervalDays, reps: u1.reps);
    final u2 = sm2Update(p2, true, 0.9, 800);
    expect(u2.intervalDays, greaterThanOrEqualTo(u1.intervalDays));
  });
}

