import 'dart:math';

class Ucb1Bandit {
  final int k;
  final List<int> pulls;
  final List<double> rewards;
  int total;
  Ucb1Bandit(this.k)
      : pulls = List.filled(k, 0),
        rewards = List.filled(k, 0.0),
        total = 0;

  int select() {
    for (int i = 0; i < k; i++) {
      if (pulls[i] == 0) return i;
    }
    final t = total;
    double best = -1e9;
    int bestIdx = 0;
    for (int i = 0; i < k; i++) {
      final avg = rewards[i] / pulls[i];
      final ucb = avg + sqrt(2 * log(t) / pulls[i]);
      if (ucb > best) {
        best = ucb;
        bestIdx = i;
      }
    }
    return bestIdx;
  }

  void update(int arm, double reward) {
    pulls[arm] += 1;
    rewards[arm] += reward;
    total += 1;
  }
}

