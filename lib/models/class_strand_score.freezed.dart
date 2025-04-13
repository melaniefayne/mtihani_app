// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_strand_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassStrandScore _$ClassStrandScoreFromJson(Map<String, dynamic> json) {
  return _ClassStrandScore.fromJson(json);
}

/// @nodoc
mixin _$ClassStrandScore {
  ExamScore? get strand_score => throw _privateConstructorUsedError;
  List<ExamScore>? get sub_strand_scores => throw _privateConstructorUsedError;

  /// Serializes this ClassStrandScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassStrandScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassStrandScoreCopyWith<ClassStrandScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassStrandScoreCopyWith<$Res> {
  factory $ClassStrandScoreCopyWith(
          ClassStrandScore value, $Res Function(ClassStrandScore) then) =
      _$ClassStrandScoreCopyWithImpl<$Res, ClassStrandScore>;
  @useResult
  $Res call({ExamScore? strand_score, List<ExamScore>? sub_strand_scores});

  $ExamScoreCopyWith<$Res>? get strand_score;
}

/// @nodoc
class _$ClassStrandScoreCopyWithImpl<$Res, $Val extends ClassStrandScore>
    implements $ClassStrandScoreCopyWith<$Res> {
  _$ClassStrandScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassStrandScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strand_score = freezed,
    Object? sub_strand_scores = freezed,
  }) {
    return _then(_value.copyWith(
      strand_score: freezed == strand_score
          ? _value.strand_score
          : strand_score // ignore: cast_nullable_to_non_nullable
              as ExamScore?,
      sub_strand_scores: freezed == sub_strand_scores
          ? _value.sub_strand_scores
          : sub_strand_scores // ignore: cast_nullable_to_non_nullable
              as List<ExamScore>?,
    ) as $Val);
  }

  /// Create a copy of ClassStrandScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExamScoreCopyWith<$Res>? get strand_score {
    if (_value.strand_score == null) {
      return null;
    }

    return $ExamScoreCopyWith<$Res>(_value.strand_score!, (value) {
      return _then(_value.copyWith(strand_score: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClassStrandScoreImplCopyWith<$Res>
    implements $ClassStrandScoreCopyWith<$Res> {
  factory _$$ClassStrandScoreImplCopyWith(_$ClassStrandScoreImpl value,
          $Res Function(_$ClassStrandScoreImpl) then) =
      __$$ClassStrandScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExamScore? strand_score, List<ExamScore>? sub_strand_scores});

  @override
  $ExamScoreCopyWith<$Res>? get strand_score;
}

/// @nodoc
class __$$ClassStrandScoreImplCopyWithImpl<$Res>
    extends _$ClassStrandScoreCopyWithImpl<$Res, _$ClassStrandScoreImpl>
    implements _$$ClassStrandScoreImplCopyWith<$Res> {
  __$$ClassStrandScoreImplCopyWithImpl(_$ClassStrandScoreImpl _value,
      $Res Function(_$ClassStrandScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassStrandScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strand_score = freezed,
    Object? sub_strand_scores = freezed,
  }) {
    return _then(_$ClassStrandScoreImpl(
      strand_score: freezed == strand_score
          ? _value.strand_score
          : strand_score // ignore: cast_nullable_to_non_nullable
              as ExamScore?,
      sub_strand_scores: freezed == sub_strand_scores
          ? _value._sub_strand_scores
          : sub_strand_scores // ignore: cast_nullable_to_non_nullable
              as List<ExamScore>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassStrandScoreImpl implements _ClassStrandScore {
  _$ClassStrandScoreImpl(
      {this.strand_score, final List<ExamScore>? sub_strand_scores})
      : _sub_strand_scores = sub_strand_scores;

  factory _$ClassStrandScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassStrandScoreImplFromJson(json);

  @override
  final ExamScore? strand_score;
  final List<ExamScore>? _sub_strand_scores;
  @override
  List<ExamScore>? get sub_strand_scores {
    final value = _sub_strand_scores;
    if (value == null) return null;
    if (_sub_strand_scores is EqualUnmodifiableListView)
      return _sub_strand_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClassStrandScore(strand_score: $strand_score, sub_strand_scores: $sub_strand_scores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassStrandScoreImpl &&
            (identical(other.strand_score, strand_score) ||
                other.strand_score == strand_score) &&
            const DeepCollectionEquality()
                .equals(other._sub_strand_scores, _sub_strand_scores));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, strand_score,
      const DeepCollectionEquality().hash(_sub_strand_scores));

  /// Create a copy of ClassStrandScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassStrandScoreImplCopyWith<_$ClassStrandScoreImpl> get copyWith =>
      __$$ClassStrandScoreImplCopyWithImpl<_$ClassStrandScoreImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassStrandScoreImplToJson(
      this,
    );
  }
}

abstract class _ClassStrandScore implements ClassStrandScore {
  factory _ClassStrandScore(
      {final ExamScore? strand_score,
      final List<ExamScore>? sub_strand_scores}) = _$ClassStrandScoreImpl;

  factory _ClassStrandScore.fromJson(Map<String, dynamic> json) =
      _$ClassStrandScoreImpl.fromJson;

  @override
  ExamScore? get strand_score;
  @override
  List<ExamScore>? get sub_strand_scores;

  /// Create a copy of ClassStrandScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassStrandScoreImplCopyWith<_$ClassStrandScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExamScore _$ExamScoreFromJson(Map<String, dynamic> json) {
  return _ExamScore.fromJson(json);
}

/// @nodoc
mixin _$ExamScore {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;

  /// Serializes this ExamScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamScoreCopyWith<ExamScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamScoreCopyWith<$Res> {
  factory $ExamScoreCopyWith(ExamScore value, $Res Function(ExamScore) then) =
      _$ExamScoreCopyWithImpl<$Res, ExamScore>;
  @useResult
  $Res call({int? id, String? name, double? score});
}

/// @nodoc
class _$ExamScoreCopyWithImpl<$Res, $Val extends ExamScore>
    implements $ExamScoreCopyWith<$Res> {
  _$ExamScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamScoreImplCopyWith<$Res>
    implements $ExamScoreCopyWith<$Res> {
  factory _$$ExamScoreImplCopyWith(
          _$ExamScoreImpl value, $Res Function(_$ExamScoreImpl) then) =
      __$$ExamScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, double? score});
}

/// @nodoc
class __$$ExamScoreImplCopyWithImpl<$Res>
    extends _$ExamScoreCopyWithImpl<$Res, _$ExamScoreImpl>
    implements _$$ExamScoreImplCopyWith<$Res> {
  __$$ExamScoreImplCopyWithImpl(
      _$ExamScoreImpl _value, $Res Function(_$ExamScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? score = freezed,
  }) {
    return _then(_$ExamScoreImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamScoreImpl implements _ExamScore {
  _$ExamScoreImpl({this.id, this.name, this.score});

  factory _$ExamScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamScoreImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? score;

  @override
  String toString() {
    return 'ExamScore(id: $id, name: $name, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamScoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, score);

  /// Create a copy of ExamScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamScoreImplCopyWith<_$ExamScoreImpl> get copyWith =>
      __$$ExamScoreImplCopyWithImpl<_$ExamScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamScoreImplToJson(
      this,
    );
  }
}

abstract class _ExamScore implements ExamScore {
  factory _ExamScore({final int? id, final String? name, final double? score}) =
      _$ExamScoreImpl;

  factory _ExamScore.fromJson(Map<String, dynamic> json) =
      _$ExamScoreImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  double? get score;

  /// Create a copy of ExamScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamScoreImplCopyWith<_$ExamScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
