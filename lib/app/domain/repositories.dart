import 'dart:convert';

import 'package:drift/drift.dart' as d;

import '../core/net/result.dart';
import '../data/drift/local_db.dart';
import 'models.dart';

class Repositories {
  final ItemRepository items;
  final AttemptRepository attempts;
  final ErrorTagRepository errorTags;
  final ConceptRepository concepts;
  final EvidenceRepository evidences;
  Repositories({
    required this.items,
    required this.attempts,
    required this.errorTags,
    required this.concepts,
    required this.evidences,
  });

  factory Repositories.local(LocalDb db) => Repositories(
        items: ItemRepository(db),
        attempts: AttemptRepository(db),
        errorTags: ErrorTagRepository(db),
        concepts: ConceptRepository(db),
        evidences: EvidenceRepository(db),
      );
}

class ItemRepository {
  final LocalDb db;
  ItemRepository(this.db);

  Future<Result<void>> upsertAll(List<Item> list) async {
    try {
      await db.batch((b) {
        for (final it in list) {
          b.insertAllOnConflictUpdate(
            db.items,
            [
              ItemsCompanion(
                id: d.Value(it.id),
                stem: d.Value(it.stem),
                optionsJson: d.Value(jsonEncode(it.options)),
                answerIndex: d.Value(it.answerIndex),
                conceptId: d.Value(it.conceptId),
                difficulty: d.Value(it.difficulty),
                sourceRef: d.Value(it.sourceRef),
              )
            ],
          );
        }
      });
      return const Ok(null);
    } catch (e) {
      return Err(Failure('db_items_upsert', 'Failed to upsert items', cause: e));
    }
  }

  Future<List<Item>> all() async {
    final rows = await db.select(db.items).get();
    return rows
        .map((r) => Item(
              id: r.id,
              stem: r.stem,
              options: (jsonDecode(r.optionsJson) as List).cast<String>(),
              answerIndex: r.answerIndex,
              conceptId: r.conceptId,
              difficulty: r.difficulty,
              sourceRef: r.sourceRef,
            ))
        .toList();
  }

  Future<List<Item>> dueToday(DateTime now) async {
    final q = db.select(db.items)..where((t) => t.nextReview.isNull() | t.nextReview.isSmallerOrEqualValue(now));
    final rows = await q.get();
    return rows
        .map((r) => Item(
              id: r.id,
              stem: r.stem,
              options: (jsonDecode(r.optionsJson) as List).cast<String>(),
              answerIndex: r.answerIndex,
              conceptId: r.conceptId,
              difficulty: r.difficulty,
              sourceRef: r.sourceRef,
            ))
        .toList();
  }

  Future<void> updateScheduling(
    String id, {
    required double ef,
    required int intervalDays,
    required int reps,
    required DateTime nextReview,
  }) async {
    await (db.update(db.items)..where((t) => t.id.equals(id))).write(
      ItemsCompanion(
        ef: d.Value(ef),
        intervalDays: d.Value(intervalDays),
        reps: d.Value(reps),
        nextReview: d.Value(nextReview),
      ),
    );
  }
}

class AttemptRepository {
  final LocalDb db;
  AttemptRepository(this.db);

  Future<void> add(Attempt a) async {
    await db.into(db.attempts).insert(
          AttemptsCompanion(
            id: d.Value(a.id),
            itemId: d.Value(a.itemId),
            correct: d.Value(a.correct),
            latencyMs: d.Value(a.latencyMs),
            confidence: d.Value(a.confidence),
            errorTagIdsJson: d.Value(jsonEncode(a.errorTagIds)),
            createdAt: d.Value(a.createdAt),
          ),
          mode: d.InsertMode.insertOrReplace,
        );
  }

  Future<Map<String, int>> errorTagHistogram() async {
    final rows = await db.select(db.attempts).get();
    final counts = <String, int>{};
    for (final r in rows) {
      final tags = (jsonDecode(r.errorTagIdsJson) as List).cast<String>();
      for (final t in tags) {
        counts[t] = (counts[t] ?? 0) + 1;
      }
    }
    return counts;
  }
}

class ErrorTagRepository {
  final LocalDb db;
  ErrorTagRepository(this.db);
  Future<List<ErrorTag>> all() async {
    final rows = await db.select(db.errorTags).get();
    return rows
        .map((r) => ErrorTag(
              id: r.id,
              name: r.name,
              pattern: r.pattern,
              notes: r.notes,
            ))
        .toList();
  }
  Future<void> upsertAll(List<ErrorTag> tags) async {
    await db.batch((b) {
      b.insertAllOnConflictUpdate(
        db.errorTags,
        tags
            .map((t) => ErrorTagsCompanion(
                  id: d.Value(t.id),
                  name: d.Value(t.name),
                  pattern: d.Value(t.pattern),
                  notes: d.Value(t.notes),
                ))
            .toList(),
      );
    });
  }
}

class ConceptRepository {
  final LocalDb db;
  ConceptRepository(this.db);
}

class EvidenceRepository {
  final LocalDb db;
  EvidenceRepository(this.db);

  Future<void> addEvidence(Evidence e) async {
    await db.into(db.evidences).insert(
          EvidencesCompanion(
            id: d.Value(e.id),
            itemId: d.Value(e.itemId),
            sourceUri: d.Value(e.sourceUri),
            snippet: d.Value(e.snippet),
            offsetsJson: d.Value('[${e.offsets[0]},${e.offsets[1]}]'),
          ),
          mode: d.InsertMode.insertOrReplace,
        );
  }
}
