import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class ConceptNode with _$ConceptNode {
  const factory ConceptNode({
    required String id,
    required String title,
    @Default(<String>[]) List<String> prereqIds,
    @Default(0.0) double mastery,
  }) = _ConceptNode;

  factory ConceptNode.fromJson(Map<String, dynamic> json) => _$ConceptNodeFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String stem,
    required List<String> options,
    required int answerIndex,
    String? conceptId,
    @Default(0.5) double difficulty,
    String? sourceRef,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class Attempt with _$Attempt {
  const factory Attempt({
    required String id,
    required String itemId,
    required bool correct,
    required int latencyMs,
    required double confidence,
    @Default(<String>[]) List<String> errorTagIds,
    required DateTime createdAt,
  }) = _Attempt;

  factory Attempt.fromJson(Map<String, dynamic> json) => _$AttemptFromJson(json);
}

@freezed
class ErrorTag with _$ErrorTag {
  const factory ErrorTag({
    required String id,
    required String name,
    String? pattern,
    String? notes,
  }) = _ErrorTag;

  factory ErrorTag.fromJson(Map<String, dynamic> json) => _$ErrorTagFromJson(json);
}

@freezed
class Session with _$Session {
  const factory Session({
    required String id,
    required DateTime start,
    DateTime? end,
    @Default(<String>[]) List<String> interventionLog,
    @Default(<String>[]) List<String> focusBreaks,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
}

@freezed
class Evidence with _$Evidence {
  const factory Evidence({
    required String id,
    required String itemId,
    required String sourceUri,
    required String snippet,
    required List<int> offsets,
  }) = _Evidence;

  factory Evidence.fromJson(Map<String, dynamic> json) => _$EvidenceFromJson(json);
}

