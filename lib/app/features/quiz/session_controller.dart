import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/di/providers.dart';
import '../../core/net/result.dart';
import '../../domain/models.dart';
import '../../domain/repositories.dart';
import '../review/sm2.dart';
import 'bandit.dart';

final sessionControllerProvider = NotifierProvider<SessionController, AsyncValue<Item?>>(
  SessionController.new,
);

class SessionController extends Notifier<AsyncValue<Item?>> {
  late final Repositories repos;
  late final Uuid uuid;
  late final Ucb1Bandit bandit;
  List<Item> _pool = [];
  Item? _current;
  DateTime? _shownAt;

  @override
  AsyncValue<Item?> build() {
    repos = ref.read(repositoriesProvider);
    uuid = ref.read(uuidProvider);
    bandit = Ucb1Bandit(3);
    _load();
    // Show 'No items' by default for immediate UI feedback/tests
    return const AsyncValue.data(null);
  }

  Future<void> _load() async {
    final items = await repos.items.all();
    _pool = items;
    _next();
  }

  void _next() {
    if (_pool.isEmpty) {
      state = const AsyncValue.data(null);
      return;
    }
    final arm = bandit.select();
    final double minD = arm == 0 ? 0.0 : (arm == 1 ? 0.34 : 0.67);
    final double maxD = arm == 0 ? 0.33 : (arm == 1 ? 0.66 : 1.0);
    final filtered = _pool.where((e) => e.difficulty >= minD && e.difficulty <= maxD).toList();
    final candidates = (filtered.isNotEmpty ? filtered : _pool).toList()..shuffle();
    _current = candidates.first;
    _shownAt = DateTime.now();
    state = AsyncValue.data(_current);
  }

  Future<Result<Attempt>> submit(int chosenIndex, double confidence) async {
    final now = DateTime.now();
    final shown = _shownAt ?? now;
    final latency = now.difference(shown).inMilliseconds;
    final item = _current!;
    final correct = chosenIndex == item.answerIndex;
    final att = Attempt(
      id: uuid.v4(),
      itemId: item.id,
      correct: correct,
      latencyMs: latency,
      confidence: confidence,
      errorTagIds: const [],
      createdAt: now,
    );
    await repos.attempts.add(att);
    final reward = (correct ? 1.0 : 0.0) * (0.5 + 0.5 * confidence);
    final arm = item.difficulty < 0.34
        ? 0
        : (item.difficulty <= 0.66
            ? 1
            : 2);
    bandit.update(arm, reward);
    final params = Sm2Params();
    final upd = sm2Update(params, correct, confidence, latency);
    await repos.items.updateScheduling(item.id,
        ef: upd.ef, intervalDays: upd.intervalDays, reps: upd.reps, nextReview: now.add(Duration(days: upd.intervalDays)));
    _next();
    return Ok(att);
  }
}
