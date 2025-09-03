// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConceptNode _$ConceptNodeFromJson(Map<String, dynamic> json) {
  return _ConceptNode.fromJson(json);
}

/// @nodoc
mixin _$ConceptNode {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get prereqIds => throw _privateConstructorUsedError;
  double get mastery => throw _privateConstructorUsedError;

  /// Serializes this ConceptNode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConceptNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConceptNodeCopyWith<ConceptNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptNodeCopyWith<$Res> {
  factory $ConceptNodeCopyWith(
          ConceptNode value, $Res Function(ConceptNode) then) =
      _$ConceptNodeCopyWithImpl<$Res, ConceptNode>;
  @useResult
  $Res call({String id, String title, List<String> prereqIds, double mastery});
}

/// @nodoc
class _$ConceptNodeCopyWithImpl<$Res, $Val extends ConceptNode>
    implements $ConceptNodeCopyWith<$Res> {
  _$ConceptNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConceptNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? prereqIds = null,
    Object? mastery = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      prereqIds: null == prereqIds
          ? _value.prereqIds
          : prereqIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mastery: null == mastery
          ? _value.mastery
          : mastery // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConceptNodeImplCopyWith<$Res>
    implements $ConceptNodeCopyWith<$Res> {
  factory _$$ConceptNodeImplCopyWith(
          _$ConceptNodeImpl value, $Res Function(_$ConceptNodeImpl) then) =
      __$$ConceptNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, List<String> prereqIds, double mastery});
}

/// @nodoc
class __$$ConceptNodeImplCopyWithImpl<$Res>
    extends _$ConceptNodeCopyWithImpl<$Res, _$ConceptNodeImpl>
    implements _$$ConceptNodeImplCopyWith<$Res> {
  __$$ConceptNodeImplCopyWithImpl(
      _$ConceptNodeImpl _value, $Res Function(_$ConceptNodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? prereqIds = null,
    Object? mastery = null,
  }) {
    return _then(_$ConceptNodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      prereqIds: null == prereqIds
          ? _value._prereqIds
          : prereqIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mastery: null == mastery
          ? _value.mastery
          : mastery // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConceptNodeImpl implements _ConceptNode {
  const _$ConceptNodeImpl(
      {required this.id,
      required this.title,
      final List<String> prereqIds = const <String>[],
      this.mastery = 0.0})
      : _prereqIds = prereqIds;

  factory _$ConceptNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConceptNodeImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _prereqIds;
  @override
  @JsonKey()
  List<String> get prereqIds {
    if (_prereqIds is EqualUnmodifiableListView) return _prereqIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prereqIds);
  }

  @override
  @JsonKey()
  final double mastery;

  @override
  String toString() {
    return 'ConceptNode(id: $id, title: $title, prereqIds: $prereqIds, mastery: $mastery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConceptNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._prereqIds, _prereqIds) &&
            (identical(other.mastery, mastery) || other.mastery == mastery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(_prereqIds), mastery);

  /// Create a copy of ConceptNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConceptNodeImplCopyWith<_$ConceptNodeImpl> get copyWith =>
      __$$ConceptNodeImplCopyWithImpl<_$ConceptNodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConceptNodeImplToJson(
      this,
    );
  }
}

abstract class _ConceptNode implements ConceptNode {
  const factory _ConceptNode(
      {required final String id,
      required final String title,
      final List<String> prereqIds,
      final double mastery}) = _$ConceptNodeImpl;

  factory _ConceptNode.fromJson(Map<String, dynamic> json) =
      _$ConceptNodeImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get prereqIds;
  @override
  double get mastery;

  /// Create a copy of ConceptNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConceptNodeImplCopyWith<_$ConceptNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  String get stem => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  int get answerIndex => throw _privateConstructorUsedError;
  String? get conceptId => throw _privateConstructorUsedError;
  double get difficulty => throw _privateConstructorUsedError;
  String? get sourceRef => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String id,
      String stem,
      List<String> options,
      int answerIndex,
      String? conceptId,
      double difficulty,
      String? sourceRef});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stem = null,
    Object? options = null,
    Object? answerIndex = null,
    Object? conceptId = freezed,
    Object? difficulty = null,
    Object? sourceRef = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stem: null == stem
          ? _value.stem
          : stem // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answerIndex: null == answerIndex
          ? _value.answerIndex
          : answerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      conceptId: freezed == conceptId
          ? _value.conceptId
          : conceptId // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as double,
      sourceRef: freezed == sourceRef
          ? _value.sourceRef
          : sourceRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String stem,
      List<String> options,
      int answerIndex,
      String? conceptId,
      double difficulty,
      String? sourceRef});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stem = null,
    Object? options = null,
    Object? answerIndex = null,
    Object? conceptId = freezed,
    Object? difficulty = null,
    Object? sourceRef = freezed,
  }) {
    return _then(_$ItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stem: null == stem
          ? _value.stem
          : stem // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answerIndex: null == answerIndex
          ? _value.answerIndex
          : answerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      conceptId: freezed == conceptId
          ? _value.conceptId
          : conceptId // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as double,
      sourceRef: freezed == sourceRef
          ? _value.sourceRef
          : sourceRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl(
      {required this.id,
      required this.stem,
      required final List<String> options,
      required this.answerIndex,
      this.conceptId,
      this.difficulty = 0.5,
      this.sourceRef})
      : _options = options;

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String id;
  @override
  final String stem;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int answerIndex;
  @override
  final String? conceptId;
  @override
  @JsonKey()
  final double difficulty;
  @override
  final String? sourceRef;

  @override
  String toString() {
    return 'Item(id: $id, stem: $stem, options: $options, answerIndex: $answerIndex, conceptId: $conceptId, difficulty: $difficulty, sourceRef: $sourceRef)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stem, stem) || other.stem == stem) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.answerIndex, answerIndex) ||
                other.answerIndex == answerIndex) &&
            (identical(other.conceptId, conceptId) ||
                other.conceptId == conceptId) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.sourceRef, sourceRef) ||
                other.sourceRef == sourceRef));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      stem,
      const DeepCollectionEquality().hash(_options),
      answerIndex,
      conceptId,
      difficulty,
      sourceRef);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required final String id,
      required final String stem,
      required final List<String> options,
      required final int answerIndex,
      final String? conceptId,
      final double difficulty,
      final String? sourceRef}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get id;
  @override
  String get stem;
  @override
  List<String> get options;
  @override
  int get answerIndex;
  @override
  String? get conceptId;
  @override
  double get difficulty;
  @override
  String? get sourceRef;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attempt _$AttemptFromJson(Map<String, dynamic> json) {
  return _Attempt.fromJson(json);
}

/// @nodoc
mixin _$Attempt {
  String get id => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  bool get correct => throw _privateConstructorUsedError;
  int get latencyMs => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get errorTagIds => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Attempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttemptCopyWith<Attempt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttemptCopyWith<$Res> {
  factory $AttemptCopyWith(Attempt value, $Res Function(Attempt) then) =
      _$AttemptCopyWithImpl<$Res, Attempt>;
  @useResult
  $Res call(
      {String id,
      String itemId,
      bool correct,
      int latencyMs,
      double confidence,
      List<String> errorTagIds,
      DateTime createdAt});
}

/// @nodoc
class _$AttemptCopyWithImpl<$Res, $Val extends Attempt>
    implements $AttemptCopyWith<$Res> {
  _$AttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? correct = null,
    Object? latencyMs = null,
    Object? confidence = null,
    Object? errorTagIds = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
      latencyMs: null == latencyMs
          ? _value.latencyMs
          : latencyMs // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      errorTagIds: null == errorTagIds
          ? _value.errorTagIds
          : errorTagIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttemptImplCopyWith<$Res> implements $AttemptCopyWith<$Res> {
  factory _$$AttemptImplCopyWith(
          _$AttemptImpl value, $Res Function(_$AttemptImpl) then) =
      __$$AttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String itemId,
      bool correct,
      int latencyMs,
      double confidence,
      List<String> errorTagIds,
      DateTime createdAt});
}

/// @nodoc
class __$$AttemptImplCopyWithImpl<$Res>
    extends _$AttemptCopyWithImpl<$Res, _$AttemptImpl>
    implements _$$AttemptImplCopyWith<$Res> {
  __$$AttemptImplCopyWithImpl(
      _$AttemptImpl _value, $Res Function(_$AttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? correct = null,
    Object? latencyMs = null,
    Object? confidence = null,
    Object? errorTagIds = null,
    Object? createdAt = null,
  }) {
    return _then(_$AttemptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
      latencyMs: null == latencyMs
          ? _value.latencyMs
          : latencyMs // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      errorTagIds: null == errorTagIds
          ? _value._errorTagIds
          : errorTagIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttemptImpl implements _Attempt {
  const _$AttemptImpl(
      {required this.id,
      required this.itemId,
      required this.correct,
      required this.latencyMs,
      required this.confidence,
      final List<String> errorTagIds = const <String>[],
      required this.createdAt})
      : _errorTagIds = errorTagIds;

  factory _$AttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttemptImplFromJson(json);

  @override
  final String id;
  @override
  final String itemId;
  @override
  final bool correct;
  @override
  final int latencyMs;
  @override
  final double confidence;
  final List<String> _errorTagIds;
  @override
  @JsonKey()
  List<String> get errorTagIds {
    if (_errorTagIds is EqualUnmodifiableListView) return _errorTagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errorTagIds);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Attempt(id: $id, itemId: $itemId, correct: $correct, latencyMs: $latencyMs, confidence: $confidence, errorTagIds: $errorTagIds, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.latencyMs, latencyMs) ||
                other.latencyMs == latencyMs) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality()
                .equals(other._errorTagIds, _errorTagIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, itemId, correct, latencyMs,
      confidence, const DeepCollectionEquality().hash(_errorTagIds), createdAt);

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttemptImplCopyWith<_$AttemptImpl> get copyWith =>
      __$$AttemptImplCopyWithImpl<_$AttemptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttemptImplToJson(
      this,
    );
  }
}

abstract class _Attempt implements Attempt {
  const factory _Attempt(
      {required final String id,
      required final String itemId,
      required final bool correct,
      required final int latencyMs,
      required final double confidence,
      final List<String> errorTagIds,
      required final DateTime createdAt}) = _$AttemptImpl;

  factory _Attempt.fromJson(Map<String, dynamic> json) = _$AttemptImpl.fromJson;

  @override
  String get id;
  @override
  String get itemId;
  @override
  bool get correct;
  @override
  int get latencyMs;
  @override
  double get confidence;
  @override
  List<String> get errorTagIds;
  @override
  DateTime get createdAt;

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttemptImplCopyWith<_$AttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ErrorTag _$ErrorTagFromJson(Map<String, dynamic> json) {
  return _ErrorTag.fromJson(json);
}

/// @nodoc
mixin _$ErrorTag {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get pattern => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this ErrorTag to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ErrorTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorTagCopyWith<ErrorTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorTagCopyWith<$Res> {
  factory $ErrorTagCopyWith(ErrorTag value, $Res Function(ErrorTag) then) =
      _$ErrorTagCopyWithImpl<$Res, ErrorTag>;
  @useResult
  $Res call({String id, String name, String? pattern, String? notes});
}

/// @nodoc
class _$ErrorTagCopyWithImpl<$Res, $Val extends ErrorTag>
    implements $ErrorTagCopyWith<$Res> {
  _$ErrorTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pattern = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: freezed == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorTagImplCopyWith<$Res>
    implements $ErrorTagCopyWith<$Res> {
  factory _$$ErrorTagImplCopyWith(
          _$ErrorTagImpl value, $Res Function(_$ErrorTagImpl) then) =
      __$$ErrorTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? pattern, String? notes});
}

/// @nodoc
class __$$ErrorTagImplCopyWithImpl<$Res>
    extends _$ErrorTagCopyWithImpl<$Res, _$ErrorTagImpl>
    implements _$$ErrorTagImplCopyWith<$Res> {
  __$$ErrorTagImplCopyWithImpl(
      _$ErrorTagImpl _value, $Res Function(_$ErrorTagImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErrorTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pattern = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$ErrorTagImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: freezed == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorTagImpl implements _ErrorTag {
  const _$ErrorTagImpl(
      {required this.id, required this.name, this.pattern, this.notes});

  factory _$ErrorTagImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorTagImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? pattern;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ErrorTag(id: $id, name: $name, pattern: $pattern, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorTagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, pattern, notes);

  /// Create a copy of ErrorTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorTagImplCopyWith<_$ErrorTagImpl> get copyWith =>
      __$$ErrorTagImplCopyWithImpl<_$ErrorTagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorTagImplToJson(
      this,
    );
  }
}

abstract class _ErrorTag implements ErrorTag {
  const factory _ErrorTag(
      {required final String id,
      required final String name,
      final String? pattern,
      final String? notes}) = _$ErrorTagImpl;

  factory _ErrorTag.fromJson(Map<String, dynamic> json) =
      _$ErrorTagImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get pattern;
  @override
  String? get notes;

  /// Create a copy of ErrorTag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorTagImplCopyWith<_$ErrorTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  String get id => throw _privateConstructorUsedError;
  DateTime get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;
  List<String> get interventionLog => throw _privateConstructorUsedError;
  List<String> get focusBreaks => throw _privateConstructorUsedError;

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {String id,
      DateTime start,
      DateTime? end,
      List<String> interventionLog,
      List<String> focusBreaks});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = freezed,
    Object? interventionLog = null,
    Object? focusBreaks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      interventionLog: null == interventionLog
          ? _value.interventionLog
          : interventionLog // ignore: cast_nullable_to_non_nullable
              as List<String>,
      focusBreaks: null == focusBreaks
          ? _value.focusBreaks
          : focusBreaks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime start,
      DateTime? end,
      List<String> interventionLog,
      List<String> focusBreaks});
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = freezed,
    Object? interventionLog = null,
    Object? focusBreaks = null,
  }) {
    return _then(_$SessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      interventionLog: null == interventionLog
          ? _value._interventionLog
          : interventionLog // ignore: cast_nullable_to_non_nullable
              as List<String>,
      focusBreaks: null == focusBreaks
          ? _value._focusBreaks
          : focusBreaks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionImpl implements _Session {
  const _$SessionImpl(
      {required this.id,
      required this.start,
      this.end,
      final List<String> interventionLog = const <String>[],
      final List<String> focusBreaks = const <String>[]})
      : _interventionLog = interventionLog,
        _focusBreaks = focusBreaks;

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime start;
  @override
  final DateTime? end;
  final List<String> _interventionLog;
  @override
  @JsonKey()
  List<String> get interventionLog {
    if (_interventionLog is EqualUnmodifiableListView) return _interventionLog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interventionLog);
  }

  final List<String> _focusBreaks;
  @override
  @JsonKey()
  List<String> get focusBreaks {
    if (_focusBreaks is EqualUnmodifiableListView) return _focusBreaks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_focusBreaks);
  }

  @override
  String toString() {
    return 'Session(id: $id, start: $start, end: $end, interventionLog: $interventionLog, focusBreaks: $focusBreaks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality()
                .equals(other._interventionLog, _interventionLog) &&
            const DeepCollectionEquality()
                .equals(other._focusBreaks, _focusBreaks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      start,
      end,
      const DeepCollectionEquality().hash(_interventionLog),
      const DeepCollectionEquality().hash(_focusBreaks));

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(
      this,
    );
  }
}

abstract class _Session implements Session {
  const factory _Session(
      {required final String id,
      required final DateTime start,
      final DateTime? end,
      final List<String> interventionLog,
      final List<String> focusBreaks}) = _$SessionImpl;

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get start;
  @override
  DateTime? get end;
  @override
  List<String> get interventionLog;
  @override
  List<String> get focusBreaks;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Evidence _$EvidenceFromJson(Map<String, dynamic> json) {
  return _Evidence.fromJson(json);
}

/// @nodoc
mixin _$Evidence {
  String get id => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  String get sourceUri => throw _privateConstructorUsedError;
  String get snippet => throw _privateConstructorUsedError;
  List<int> get offsets => throw _privateConstructorUsedError;

  /// Serializes this Evidence to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Evidence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EvidenceCopyWith<Evidence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvidenceCopyWith<$Res> {
  factory $EvidenceCopyWith(Evidence value, $Res Function(Evidence) then) =
      _$EvidenceCopyWithImpl<$Res, Evidence>;
  @useResult
  $Res call(
      {String id,
      String itemId,
      String sourceUri,
      String snippet,
      List<int> offsets});
}

/// @nodoc
class _$EvidenceCopyWithImpl<$Res, $Val extends Evidence>
    implements $EvidenceCopyWith<$Res> {
  _$EvidenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Evidence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? sourceUri = null,
    Object? snippet = null,
    Object? offsets = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceUri: null == sourceUri
          ? _value.sourceUri
          : sourceUri // ignore: cast_nullable_to_non_nullable
              as String,
      snippet: null == snippet
          ? _value.snippet
          : snippet // ignore: cast_nullable_to_non_nullable
              as String,
      offsets: null == offsets
          ? _value.offsets
          : offsets // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EvidenceImplCopyWith<$Res>
    implements $EvidenceCopyWith<$Res> {
  factory _$$EvidenceImplCopyWith(
          _$EvidenceImpl value, $Res Function(_$EvidenceImpl) then) =
      __$$EvidenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String itemId,
      String sourceUri,
      String snippet,
      List<int> offsets});
}

/// @nodoc
class __$$EvidenceImplCopyWithImpl<$Res>
    extends _$EvidenceCopyWithImpl<$Res, _$EvidenceImpl>
    implements _$$EvidenceImplCopyWith<$Res> {
  __$$EvidenceImplCopyWithImpl(
      _$EvidenceImpl _value, $Res Function(_$EvidenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Evidence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? sourceUri = null,
    Object? snippet = null,
    Object? offsets = null,
  }) {
    return _then(_$EvidenceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceUri: null == sourceUri
          ? _value.sourceUri
          : sourceUri // ignore: cast_nullable_to_non_nullable
              as String,
      snippet: null == snippet
          ? _value.snippet
          : snippet // ignore: cast_nullable_to_non_nullable
              as String,
      offsets: null == offsets
          ? _value._offsets
          : offsets // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EvidenceImpl implements _Evidence {
  const _$EvidenceImpl(
      {required this.id,
      required this.itemId,
      required this.sourceUri,
      required this.snippet,
      required final List<int> offsets})
      : _offsets = offsets;

  factory _$EvidenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvidenceImplFromJson(json);

  @override
  final String id;
  @override
  final String itemId;
  @override
  final String sourceUri;
  @override
  final String snippet;
  final List<int> _offsets;
  @override
  List<int> get offsets {
    if (_offsets is EqualUnmodifiableListView) return _offsets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offsets);
  }

  @override
  String toString() {
    return 'Evidence(id: $id, itemId: $itemId, sourceUri: $sourceUri, snippet: $snippet, offsets: $offsets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvidenceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.sourceUri, sourceUri) ||
                other.sourceUri == sourceUri) &&
            (identical(other.snippet, snippet) || other.snippet == snippet) &&
            const DeepCollectionEquality().equals(other._offsets, _offsets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, itemId, sourceUri, snippet,
      const DeepCollectionEquality().hash(_offsets));

  /// Create a copy of Evidence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EvidenceImplCopyWith<_$EvidenceImpl> get copyWith =>
      __$$EvidenceImplCopyWithImpl<_$EvidenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvidenceImplToJson(
      this,
    );
  }
}

abstract class _Evidence implements Evidence {
  const factory _Evidence(
      {required final String id,
      required final String itemId,
      required final String sourceUri,
      required final String snippet,
      required final List<int> offsets}) = _$EvidenceImpl;

  factory _Evidence.fromJson(Map<String, dynamic> json) =
      _$EvidenceImpl.fromJson;

  @override
  String get id;
  @override
  String get itemId;
  @override
  String get sourceUri;
  @override
  String get snippet;
  @override
  List<int> get offsets;

  /// Create a copy of Evidence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EvidenceImplCopyWith<_$EvidenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
