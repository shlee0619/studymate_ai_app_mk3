import 'dart:math';

class Sm2Params {
  double ef;
  int intervalDays;
  int reps;
  Sm2Params({this.ef = 2.5, this.intervalDays = 0, this.reps = 0});
}

class ReviewUpdate {
  final double ef;
  final int intervalDays;
  final int reps;
  ReviewUpdate(this.ef, this.intervalDays, this.reps);
}

double _quality(bool correct, double confidence, int latencyMs) {
  final c = confidence.clamp(0.0, 1.0);
  final l = (latencyMs / 3000.0).clamp(0.0, 1.0);
  final q = (correct ? 1.0 : 0.0) * (0.6 + 0.4 * c) * (1.0 - 0.2 * l);
  return q; // 0..1
}

ReviewUpdate sm2Update(Sm2Params p, bool correct, double confidence, int latencyMs) {
  final q = _quality(correct, confidence, latencyMs);
  var ef = max(1.3, p.ef + (0.1 - (1 - q) * (0.08 + (1 - q) * 0.02)));
  var reps = correct ? p.reps + 1 : 0;
  int interval;
  if (!correct) {
    interval = 1;
  } else if (reps <= 1) {
    interval = 1;
  } else if (reps == 2) {
    interval = 6;
  } else {
    interval = (p.intervalDays * ef).round().clamp(1, 3650);
  }
  return ReviewUpdate(ef, interval, reps);
}

