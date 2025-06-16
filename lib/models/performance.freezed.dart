// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassExamPerformanceModel _$ClassExamPerformanceModelFromJson(
    Map<String, dynamic> json) {
  return _ClassExamPerformanceModel.fromJson(json);
}

/// @nodoc
mixin _$ClassExamPerformanceModel {
  int? get id => throw _privateConstructorUsedError;
  int? get exam => throw _privateConstructorUsedError;
  double? get avg_score => throw _privateConstructorUsedError;
  String? get avg_expectation_level => throw _privateConstructorUsedError;
  int? get student_count => throw _privateConstructorUsedError;
  List<ScoreModel>? get expectation_level_distribution =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get score_distribution =>
      throw _privateConstructorUsedError;
  ScoreModel? get score_variance => throw _privateConstructorUsedError;
  List<ScoreModel>? get bloom_skill_scores =>
      throw _privateConstructorUsedError;
  List<String>? get general_insights => throw _privateConstructorUsedError;
  List<ScoreModel>? get grade_scores => throw _privateConstructorUsedError;
  List<StrandPerformanceModel>? get strand_analysis =>
      throw _privateConstructorUsedError;
  StrandStudentMasteryModel? get strand_student_mastery =>
      throw _privateConstructorUsedError;
  List<FlaggedSubStrandModel>? get flagged_sub_strands =>
      throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;

  /// Serializes this ClassExamPerformanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassExamPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassExamPerformanceModelCopyWith<ClassExamPerformanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassExamPerformanceModelCopyWith<$Res> {
  factory $ClassExamPerformanceModelCopyWith(ClassExamPerformanceModel value,
          $Res Function(ClassExamPerformanceModel) then) =
      _$ClassExamPerformanceModelCopyWithImpl<$Res, ClassExamPerformanceModel>;
  @useResult
  $Res call(
      {int? id,
      int? exam,
      double? avg_score,
      String? avg_expectation_level,
      int? student_count,
      List<ScoreModel>? expectation_level_distribution,
      List<ScoreModel>? score_distribution,
      ScoreModel? score_variance,
      List<ScoreModel>? bloom_skill_scores,
      List<String>? general_insights,
      List<ScoreModel>? grade_scores,
      List<StrandPerformanceModel>? strand_analysis,
      StrandStudentMasteryModel? strand_student_mastery,
      List<FlaggedSubStrandModel>? flagged_sub_strands,
      DateTime? created_at,
      DateTime? updated_at});

  $ScoreModelCopyWith<$Res>? get score_variance;
  $StrandStudentMasteryModelCopyWith<$Res>? get strand_student_mastery;
}

/// @nodoc
class _$ClassExamPerformanceModelCopyWithImpl<$Res,
        $Val extends ClassExamPerformanceModel>
    implements $ClassExamPerformanceModelCopyWith<$Res> {
  _$ClassExamPerformanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassExamPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exam = freezed,
    Object? avg_score = freezed,
    Object? avg_expectation_level = freezed,
    Object? student_count = freezed,
    Object? expectation_level_distribution = freezed,
    Object? score_distribution = freezed,
    Object? score_variance = freezed,
    Object? bloom_skill_scores = freezed,
    Object? general_insights = freezed,
    Object? grade_scores = freezed,
    Object? strand_analysis = freezed,
    Object? strand_student_mastery = freezed,
    Object? flagged_sub_strands = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      exam: freezed == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_expectation_level: freezed == avg_expectation_level
          ? _value.avg_expectation_level
          : avg_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      student_count: freezed == student_count
          ? _value.student_count
          : student_count // ignore: cast_nullable_to_non_nullable
              as int?,
      expectation_level_distribution: freezed == expectation_level_distribution
          ? _value.expectation_level_distribution
          : expectation_level_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      score_distribution: freezed == score_distribution
          ? _value.score_distribution
          : score_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      score_variance: freezed == score_variance
          ? _value.score_variance
          : score_variance // ignore: cast_nullable_to_non_nullable
              as ScoreModel?,
      bloom_skill_scores: freezed == bloom_skill_scores
          ? _value.bloom_skill_scores
          : bloom_skill_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      general_insights: freezed == general_insights
          ? _value.general_insights
          : general_insights // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      grade_scores: freezed == grade_scores
          ? _value.grade_scores
          : grade_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      strand_analysis: freezed == strand_analysis
          ? _value.strand_analysis
          : strand_analysis // ignore: cast_nullable_to_non_nullable
              as List<StrandPerformanceModel>?,
      strand_student_mastery: freezed == strand_student_mastery
          ? _value.strand_student_mastery
          : strand_student_mastery // ignore: cast_nullable_to_non_nullable
              as StrandStudentMasteryModel?,
      flagged_sub_strands: freezed == flagged_sub_strands
          ? _value.flagged_sub_strands
          : flagged_sub_strands // ignore: cast_nullable_to_non_nullable
              as List<FlaggedSubStrandModel>?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ClassExamPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScoreModelCopyWith<$Res>? get score_variance {
    if (_value.score_variance == null) {
      return null;
    }

    return $ScoreModelCopyWith<$Res>(_value.score_variance!, (value) {
      return _then(_value.copyWith(score_variance: value) as $Val);
    });
  }

  /// Create a copy of ClassExamPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StrandStudentMasteryModelCopyWith<$Res>? get strand_student_mastery {
    if (_value.strand_student_mastery == null) {
      return null;
    }

    return $StrandStudentMasteryModelCopyWith<$Res>(
        _value.strand_student_mastery!, (value) {
      return _then(_value.copyWith(strand_student_mastery: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClassExamPerformanceModelImplCopyWith<$Res>
    implements $ClassExamPerformanceModelCopyWith<$Res> {
  factory _$$ClassExamPerformanceModelImplCopyWith(
          _$ClassExamPerformanceModelImpl value,
          $Res Function(_$ClassExamPerformanceModelImpl) then) =
      __$$ClassExamPerformanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? exam,
      double? avg_score,
      String? avg_expectation_level,
      int? student_count,
      List<ScoreModel>? expectation_level_distribution,
      List<ScoreModel>? score_distribution,
      ScoreModel? score_variance,
      List<ScoreModel>? bloom_skill_scores,
      List<String>? general_insights,
      List<ScoreModel>? grade_scores,
      List<StrandPerformanceModel>? strand_analysis,
      StrandStudentMasteryModel? strand_student_mastery,
      List<FlaggedSubStrandModel>? flagged_sub_strands,
      DateTime? created_at,
      DateTime? updated_at});

  @override
  $ScoreModelCopyWith<$Res>? get score_variance;
  @override
  $StrandStudentMasteryModelCopyWith<$Res>? get strand_student_mastery;
}

/// @nodoc
class __$$ClassExamPerformanceModelImplCopyWithImpl<$Res>
    extends _$ClassExamPerformanceModelCopyWithImpl<$Res,
        _$ClassExamPerformanceModelImpl>
    implements _$$ClassExamPerformanceModelImplCopyWith<$Res> {
  __$$ClassExamPerformanceModelImplCopyWithImpl(
      _$ClassExamPerformanceModelImpl _value,
      $Res Function(_$ClassExamPerformanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassExamPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exam = freezed,
    Object? avg_score = freezed,
    Object? avg_expectation_level = freezed,
    Object? student_count = freezed,
    Object? expectation_level_distribution = freezed,
    Object? score_distribution = freezed,
    Object? score_variance = freezed,
    Object? bloom_skill_scores = freezed,
    Object? general_insights = freezed,
    Object? grade_scores = freezed,
    Object? strand_analysis = freezed,
    Object? strand_student_mastery = freezed,
    Object? flagged_sub_strands = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_$ClassExamPerformanceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      exam: freezed == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_expectation_level: freezed == avg_expectation_level
          ? _value.avg_expectation_level
          : avg_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      student_count: freezed == student_count
          ? _value.student_count
          : student_count // ignore: cast_nullable_to_non_nullable
              as int?,
      expectation_level_distribution: freezed == expectation_level_distribution
          ? _value._expectation_level_distribution
          : expectation_level_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      score_distribution: freezed == score_distribution
          ? _value._score_distribution
          : score_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      score_variance: freezed == score_variance
          ? _value.score_variance
          : score_variance // ignore: cast_nullable_to_non_nullable
              as ScoreModel?,
      bloom_skill_scores: freezed == bloom_skill_scores
          ? _value._bloom_skill_scores
          : bloom_skill_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      general_insights: freezed == general_insights
          ? _value._general_insights
          : general_insights // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      grade_scores: freezed == grade_scores
          ? _value._grade_scores
          : grade_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      strand_analysis: freezed == strand_analysis
          ? _value._strand_analysis
          : strand_analysis // ignore: cast_nullable_to_non_nullable
              as List<StrandPerformanceModel>?,
      strand_student_mastery: freezed == strand_student_mastery
          ? _value.strand_student_mastery
          : strand_student_mastery // ignore: cast_nullable_to_non_nullable
              as StrandStudentMasteryModel?,
      flagged_sub_strands: freezed == flagged_sub_strands
          ? _value._flagged_sub_strands
          : flagged_sub_strands // ignore: cast_nullable_to_non_nullable
              as List<FlaggedSubStrandModel>?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassExamPerformanceModelImpl implements _ClassExamPerformanceModel {
  _$ClassExamPerformanceModelImpl(
      {this.id,
      this.exam,
      this.avg_score,
      this.avg_expectation_level,
      this.student_count,
      final List<ScoreModel>? expectation_level_distribution,
      final List<ScoreModel>? score_distribution,
      this.score_variance,
      final List<ScoreModel>? bloom_skill_scores,
      final List<String>? general_insights,
      final List<ScoreModel>? grade_scores,
      final List<StrandPerformanceModel>? strand_analysis,
      this.strand_student_mastery,
      final List<FlaggedSubStrandModel>? flagged_sub_strands,
      this.created_at,
      this.updated_at})
      : _expectation_level_distribution = expectation_level_distribution,
        _score_distribution = score_distribution,
        _bloom_skill_scores = bloom_skill_scores,
        _general_insights = general_insights,
        _grade_scores = grade_scores,
        _strand_analysis = strand_analysis,
        _flagged_sub_strands = flagged_sub_strands;

  factory _$ClassExamPerformanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassExamPerformanceModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? exam;
  @override
  final double? avg_score;
  @override
  final String? avg_expectation_level;
  @override
  final int? student_count;
  final List<ScoreModel>? _expectation_level_distribution;
  @override
  List<ScoreModel>? get expectation_level_distribution {
    final value = _expectation_level_distribution;
    if (value == null) return null;
    if (_expectation_level_distribution is EqualUnmodifiableListView)
      return _expectation_level_distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _score_distribution;
  @override
  List<ScoreModel>? get score_distribution {
    final value = _score_distribution;
    if (value == null) return null;
    if (_score_distribution is EqualUnmodifiableListView)
      return _score_distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ScoreModel? score_variance;
  final List<ScoreModel>? _bloom_skill_scores;
  @override
  List<ScoreModel>? get bloom_skill_scores {
    final value = _bloom_skill_scores;
    if (value == null) return null;
    if (_bloom_skill_scores is EqualUnmodifiableListView)
      return _bloom_skill_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _general_insights;
  @override
  List<String>? get general_insights {
    final value = _general_insights;
    if (value == null) return null;
    if (_general_insights is EqualUnmodifiableListView)
      return _general_insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _grade_scores;
  @override
  List<ScoreModel>? get grade_scores {
    final value = _grade_scores;
    if (value == null) return null;
    if (_grade_scores is EqualUnmodifiableListView) return _grade_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StrandPerformanceModel>? _strand_analysis;
  @override
  List<StrandPerformanceModel>? get strand_analysis {
    final value = _strand_analysis;
    if (value == null) return null;
    if (_strand_analysis is EqualUnmodifiableListView) return _strand_analysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final StrandStudentMasteryModel? strand_student_mastery;
  final List<FlaggedSubStrandModel>? _flagged_sub_strands;
  @override
  List<FlaggedSubStrandModel>? get flagged_sub_strands {
    final value = _flagged_sub_strands;
    if (value == null) return null;
    if (_flagged_sub_strands is EqualUnmodifiableListView)
      return _flagged_sub_strands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;

  @override
  String toString() {
    return 'ClassExamPerformanceModel(id: $id, exam: $exam, avg_score: $avg_score, avg_expectation_level: $avg_expectation_level, student_count: $student_count, expectation_level_distribution: $expectation_level_distribution, score_distribution: $score_distribution, score_variance: $score_variance, bloom_skill_scores: $bloom_skill_scores, general_insights: $general_insights, grade_scores: $grade_scores, strand_analysis: $strand_analysis, strand_student_mastery: $strand_student_mastery, flagged_sub_strands: $flagged_sub_strands, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassExamPerformanceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.avg_score, avg_score) ||
                other.avg_score == avg_score) &&
            (identical(other.avg_expectation_level, avg_expectation_level) ||
                other.avg_expectation_level == avg_expectation_level) &&
            (identical(other.student_count, student_count) ||
                other.student_count == student_count) &&
            const DeepCollectionEquality().equals(
                other._expectation_level_distribution,
                _expectation_level_distribution) &&
            const DeepCollectionEquality()
                .equals(other._score_distribution, _score_distribution) &&
            (identical(other.score_variance, score_variance) ||
                other.score_variance == score_variance) &&
            const DeepCollectionEquality()
                .equals(other._bloom_skill_scores, _bloom_skill_scores) &&
            const DeepCollectionEquality()
                .equals(other._general_insights, _general_insights) &&
            const DeepCollectionEquality()
                .equals(other._grade_scores, _grade_scores) &&
            const DeepCollectionEquality()
                .equals(other._strand_analysis, _strand_analysis) &&
            (identical(other.strand_student_mastery, strand_student_mastery) ||
                other.strand_student_mastery == strand_student_mastery) &&
            const DeepCollectionEquality()
                .equals(other._flagged_sub_strands, _flagged_sub_strands) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      exam,
      avg_score,
      avg_expectation_level,
      student_count,
      const DeepCollectionEquality().hash(_expectation_level_distribution),
      const DeepCollectionEquality().hash(_score_distribution),
      score_variance,
      const DeepCollectionEquality().hash(_bloom_skill_scores),
      const DeepCollectionEquality().hash(_general_insights),
      const DeepCollectionEquality().hash(_grade_scores),
      const DeepCollectionEquality().hash(_strand_analysis),
      strand_student_mastery,
      const DeepCollectionEquality().hash(_flagged_sub_strands),
      created_at,
      updated_at);

  /// Create a copy of ClassExamPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassExamPerformanceModelImplCopyWith<_$ClassExamPerformanceModelImpl>
      get copyWith => __$$ClassExamPerformanceModelImplCopyWithImpl<
          _$ClassExamPerformanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassExamPerformanceModelImplToJson(
      this,
    );
  }
}

abstract class _ClassExamPerformanceModel implements ClassExamPerformanceModel {
  factory _ClassExamPerformanceModel(
      {final int? id,
      final int? exam,
      final double? avg_score,
      final String? avg_expectation_level,
      final int? student_count,
      final List<ScoreModel>? expectation_level_distribution,
      final List<ScoreModel>? score_distribution,
      final ScoreModel? score_variance,
      final List<ScoreModel>? bloom_skill_scores,
      final List<String>? general_insights,
      final List<ScoreModel>? grade_scores,
      final List<StrandPerformanceModel>? strand_analysis,
      final StrandStudentMasteryModel? strand_student_mastery,
      final List<FlaggedSubStrandModel>? flagged_sub_strands,
      final DateTime? created_at,
      final DateTime? updated_at}) = _$ClassExamPerformanceModelImpl;

  factory _ClassExamPerformanceModel.fromJson(Map<String, dynamic> json) =
      _$ClassExamPerformanceModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get exam;
  @override
  double? get avg_score;
  @override
  String? get avg_expectation_level;
  @override
  int? get student_count;
  @override
  List<ScoreModel>? get expectation_level_distribution;
  @override
  List<ScoreModel>? get score_distribution;
  @override
  ScoreModel? get score_variance;
  @override
  List<ScoreModel>? get bloom_skill_scores;
  @override
  List<String>? get general_insights;
  @override
  List<ScoreModel>? get grade_scores;
  @override
  List<StrandPerformanceModel>? get strand_analysis;
  @override
  StrandStudentMasteryModel? get strand_student_mastery;
  @override
  List<FlaggedSubStrandModel>? get flagged_sub_strands;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;

  /// Create a copy of ClassExamPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassExamPerformanceModelImplCopyWith<_$ClassExamPerformanceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StrandPerformanceModel _$StrandPerformanceModelFromJson(
    Map<String, dynamic> json) {
  return _StrandPerformanceModel.fromJson(json);
}

/// @nodoc
mixin _$StrandPerformanceModel {
  String? get name => throw _privateConstructorUsedError;
  int? get grade => throw _privateConstructorUsedError;
  double? get avg_score => throw _privateConstructorUsedError;
  String? get avg_expectation_level => throw _privateConstructorUsedError;
  List<ScoreModel>? get bloom_skill_scores =>
      throw _privateConstructorUsedError;
  ScoreModel? get score_variance => throw _privateConstructorUsedError;
  List<ScoreModel>? get sub_strand_scores => throw _privateConstructorUsedError;
  List<String>? get insights => throw _privateConstructorUsedError;
  List<String>? get suggestions => throw _privateConstructorUsedError;
  List<ExamModel>? get top_students => throw _privateConstructorUsedError;
  List<ExamModel>? get bottom_students => throw _privateConstructorUsedError;

  /// Serializes this StrandPerformanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrandPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrandPerformanceModelCopyWith<StrandPerformanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrandPerformanceModelCopyWith<$Res> {
  factory $StrandPerformanceModelCopyWith(StrandPerformanceModel value,
          $Res Function(StrandPerformanceModel) then) =
      _$StrandPerformanceModelCopyWithImpl<$Res, StrandPerformanceModel>;
  @useResult
  $Res call(
      {String? name,
      int? grade,
      double? avg_score,
      String? avg_expectation_level,
      List<ScoreModel>? bloom_skill_scores,
      ScoreModel? score_variance,
      List<ScoreModel>? sub_strand_scores,
      List<String>? insights,
      List<String>? suggestions,
      List<ExamModel>? top_students,
      List<ExamModel>? bottom_students});

  $ScoreModelCopyWith<$Res>? get score_variance;
}

/// @nodoc
class _$StrandPerformanceModelCopyWithImpl<$Res,
        $Val extends StrandPerformanceModel>
    implements $StrandPerformanceModelCopyWith<$Res> {
  _$StrandPerformanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrandPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? grade = freezed,
    Object? avg_score = freezed,
    Object? avg_expectation_level = freezed,
    Object? bloom_skill_scores = freezed,
    Object? score_variance = freezed,
    Object? sub_strand_scores = freezed,
    Object? insights = freezed,
    Object? suggestions = freezed,
    Object? top_students = freezed,
    Object? bottom_students = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_expectation_level: freezed == avg_expectation_level
          ? _value.avg_expectation_level
          : avg_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      bloom_skill_scores: freezed == bloom_skill_scores
          ? _value.bloom_skill_scores
          : bloom_skill_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      score_variance: freezed == score_variance
          ? _value.score_variance
          : score_variance // ignore: cast_nullable_to_non_nullable
              as ScoreModel?,
      sub_strand_scores: freezed == sub_strand_scores
          ? _value.sub_strand_scores
          : sub_strand_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      insights: freezed == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      suggestions: freezed == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      top_students: freezed == top_students
          ? _value.top_students
          : top_students // ignore: cast_nullable_to_non_nullable
              as List<ExamModel>?,
      bottom_students: freezed == bottom_students
          ? _value.bottom_students
          : bottom_students // ignore: cast_nullable_to_non_nullable
              as List<ExamModel>?,
    ) as $Val);
  }

  /// Create a copy of StrandPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScoreModelCopyWith<$Res>? get score_variance {
    if (_value.score_variance == null) {
      return null;
    }

    return $ScoreModelCopyWith<$Res>(_value.score_variance!, (value) {
      return _then(_value.copyWith(score_variance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StrandPerformanceModelImplCopyWith<$Res>
    implements $StrandPerformanceModelCopyWith<$Res> {
  factory _$$StrandPerformanceModelImplCopyWith(
          _$StrandPerformanceModelImpl value,
          $Res Function(_$StrandPerformanceModelImpl) then) =
      __$$StrandPerformanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      int? grade,
      double? avg_score,
      String? avg_expectation_level,
      List<ScoreModel>? bloom_skill_scores,
      ScoreModel? score_variance,
      List<ScoreModel>? sub_strand_scores,
      List<String>? insights,
      List<String>? suggestions,
      List<ExamModel>? top_students,
      List<ExamModel>? bottom_students});

  @override
  $ScoreModelCopyWith<$Res>? get score_variance;
}

/// @nodoc
class __$$StrandPerformanceModelImplCopyWithImpl<$Res>
    extends _$StrandPerformanceModelCopyWithImpl<$Res,
        _$StrandPerformanceModelImpl>
    implements _$$StrandPerformanceModelImplCopyWith<$Res> {
  __$$StrandPerformanceModelImplCopyWithImpl(
      _$StrandPerformanceModelImpl _value,
      $Res Function(_$StrandPerformanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StrandPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? grade = freezed,
    Object? avg_score = freezed,
    Object? avg_expectation_level = freezed,
    Object? bloom_skill_scores = freezed,
    Object? score_variance = freezed,
    Object? sub_strand_scores = freezed,
    Object? insights = freezed,
    Object? suggestions = freezed,
    Object? top_students = freezed,
    Object? bottom_students = freezed,
  }) {
    return _then(_$StrandPerformanceModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_expectation_level: freezed == avg_expectation_level
          ? _value.avg_expectation_level
          : avg_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      bloom_skill_scores: freezed == bloom_skill_scores
          ? _value._bloom_skill_scores
          : bloom_skill_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      score_variance: freezed == score_variance
          ? _value.score_variance
          : score_variance // ignore: cast_nullable_to_non_nullable
              as ScoreModel?,
      sub_strand_scores: freezed == sub_strand_scores
          ? _value._sub_strand_scores
          : sub_strand_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      insights: freezed == insights
          ? _value._insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      suggestions: freezed == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      top_students: freezed == top_students
          ? _value._top_students
          : top_students // ignore: cast_nullable_to_non_nullable
              as List<ExamModel>?,
      bottom_students: freezed == bottom_students
          ? _value._bottom_students
          : bottom_students // ignore: cast_nullable_to_non_nullable
              as List<ExamModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrandPerformanceModelImpl implements _StrandPerformanceModel {
  _$StrandPerformanceModelImpl(
      {this.name,
      this.grade,
      this.avg_score,
      this.avg_expectation_level,
      final List<ScoreModel>? bloom_skill_scores,
      this.score_variance,
      final List<ScoreModel>? sub_strand_scores,
      final List<String>? insights,
      final List<String>? suggestions,
      final List<ExamModel>? top_students,
      final List<ExamModel>? bottom_students})
      : _bloom_skill_scores = bloom_skill_scores,
        _sub_strand_scores = sub_strand_scores,
        _insights = insights,
        _suggestions = suggestions,
        _top_students = top_students,
        _bottom_students = bottom_students;

  factory _$StrandPerformanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrandPerformanceModelImplFromJson(json);

  @override
  final String? name;
  @override
  final int? grade;
  @override
  final double? avg_score;
  @override
  final String? avg_expectation_level;
  final List<ScoreModel>? _bloom_skill_scores;
  @override
  List<ScoreModel>? get bloom_skill_scores {
    final value = _bloom_skill_scores;
    if (value == null) return null;
    if (_bloom_skill_scores is EqualUnmodifiableListView)
      return _bloom_skill_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ScoreModel? score_variance;
  final List<ScoreModel>? _sub_strand_scores;
  @override
  List<ScoreModel>? get sub_strand_scores {
    final value = _sub_strand_scores;
    if (value == null) return null;
    if (_sub_strand_scores is EqualUnmodifiableListView)
      return _sub_strand_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _insights;
  @override
  List<String>? get insights {
    final value = _insights;
    if (value == null) return null;
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _suggestions;
  @override
  List<String>? get suggestions {
    final value = _suggestions;
    if (value == null) return null;
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ExamModel>? _top_students;
  @override
  List<ExamModel>? get top_students {
    final value = _top_students;
    if (value == null) return null;
    if (_top_students is EqualUnmodifiableListView) return _top_students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ExamModel>? _bottom_students;
  @override
  List<ExamModel>? get bottom_students {
    final value = _bottom_students;
    if (value == null) return null;
    if (_bottom_students is EqualUnmodifiableListView) return _bottom_students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StrandPerformanceModel(name: $name, grade: $grade, avg_score: $avg_score, avg_expectation_level: $avg_expectation_level, bloom_skill_scores: $bloom_skill_scores, score_variance: $score_variance, sub_strand_scores: $sub_strand_scores, insights: $insights, suggestions: $suggestions, top_students: $top_students, bottom_students: $bottom_students)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrandPerformanceModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.avg_score, avg_score) ||
                other.avg_score == avg_score) &&
            (identical(other.avg_expectation_level, avg_expectation_level) ||
                other.avg_expectation_level == avg_expectation_level) &&
            const DeepCollectionEquality()
                .equals(other._bloom_skill_scores, _bloom_skill_scores) &&
            (identical(other.score_variance, score_variance) ||
                other.score_variance == score_variance) &&
            const DeepCollectionEquality()
                .equals(other._sub_strand_scores, _sub_strand_scores) &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            const DeepCollectionEquality()
                .equals(other._top_students, _top_students) &&
            const DeepCollectionEquality()
                .equals(other._bottom_students, _bottom_students));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      grade,
      avg_score,
      avg_expectation_level,
      const DeepCollectionEquality().hash(_bloom_skill_scores),
      score_variance,
      const DeepCollectionEquality().hash(_sub_strand_scores),
      const DeepCollectionEquality().hash(_insights),
      const DeepCollectionEquality().hash(_suggestions),
      const DeepCollectionEquality().hash(_top_students),
      const DeepCollectionEquality().hash(_bottom_students));

  /// Create a copy of StrandPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrandPerformanceModelImplCopyWith<_$StrandPerformanceModelImpl>
      get copyWith => __$$StrandPerformanceModelImplCopyWithImpl<
          _$StrandPerformanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrandPerformanceModelImplToJson(
      this,
    );
  }
}

abstract class _StrandPerformanceModel implements StrandPerformanceModel {
  factory _StrandPerformanceModel(
      {final String? name,
      final int? grade,
      final double? avg_score,
      final String? avg_expectation_level,
      final List<ScoreModel>? bloom_skill_scores,
      final ScoreModel? score_variance,
      final List<ScoreModel>? sub_strand_scores,
      final List<String>? insights,
      final List<String>? suggestions,
      final List<ExamModel>? top_students,
      final List<ExamModel>? bottom_students}) = _$StrandPerformanceModelImpl;

  factory _StrandPerformanceModel.fromJson(Map<String, dynamic> json) =
      _$StrandPerformanceModelImpl.fromJson;

  @override
  String? get name;
  @override
  int? get grade;
  @override
  double? get avg_score;
  @override
  String? get avg_expectation_level;
  @override
  List<ScoreModel>? get bloom_skill_scores;
  @override
  ScoreModel? get score_variance;
  @override
  List<ScoreModel>? get sub_strand_scores;
  @override
  List<String>? get insights;
  @override
  List<String>? get suggestions;
  @override
  List<ExamModel>? get top_students;
  @override
  List<ExamModel>? get bottom_students;

  /// Create a copy of StrandPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrandPerformanceModelImplCopyWith<_$StrandPerformanceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StrandStudentMasteryModel _$StrandStudentMasteryModelFromJson(
    Map<String, dynamic> json) {
  return _StrandStudentMasteryModel.fromJson(json);
}

/// @nodoc
mixin _$StrandStudentMasteryModel {
  List<String>? get strands => throw _privateConstructorUsedError;
  List<ScoreModel>? get students => throw _privateConstructorUsedError;

  /// Serializes this StrandStudentMasteryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrandStudentMasteryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrandStudentMasteryModelCopyWith<StrandStudentMasteryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrandStudentMasteryModelCopyWith<$Res> {
  factory $StrandStudentMasteryModelCopyWith(StrandStudentMasteryModel value,
          $Res Function(StrandStudentMasteryModel) then) =
      _$StrandStudentMasteryModelCopyWithImpl<$Res, StrandStudentMasteryModel>;
  @useResult
  $Res call({List<String>? strands, List<ScoreModel>? students});
}

/// @nodoc
class _$StrandStudentMasteryModelCopyWithImpl<$Res,
        $Val extends StrandStudentMasteryModel>
    implements $StrandStudentMasteryModelCopyWith<$Res> {
  _$StrandStudentMasteryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrandStudentMasteryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strands = freezed,
    Object? students = freezed,
  }) {
    return _then(_value.copyWith(
      strands: freezed == strands
          ? _value.strands
          : strands // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StrandStudentMasteryModelImplCopyWith<$Res>
    implements $StrandStudentMasteryModelCopyWith<$Res> {
  factory _$$StrandStudentMasteryModelImplCopyWith(
          _$StrandStudentMasteryModelImpl value,
          $Res Function(_$StrandStudentMasteryModelImpl) then) =
      __$$StrandStudentMasteryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? strands, List<ScoreModel>? students});
}

/// @nodoc
class __$$StrandStudentMasteryModelImplCopyWithImpl<$Res>
    extends _$StrandStudentMasteryModelCopyWithImpl<$Res,
        _$StrandStudentMasteryModelImpl>
    implements _$$StrandStudentMasteryModelImplCopyWith<$Res> {
  __$$StrandStudentMasteryModelImplCopyWithImpl(
      _$StrandStudentMasteryModelImpl _value,
      $Res Function(_$StrandStudentMasteryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StrandStudentMasteryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strands = freezed,
    Object? students = freezed,
  }) {
    return _then(_$StrandStudentMasteryModelImpl(
      strands: freezed == strands
          ? _value._strands
          : strands // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      students: freezed == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrandStudentMasteryModelImpl implements _StrandStudentMasteryModel {
  _$StrandStudentMasteryModelImpl(
      {final List<String>? strands, final List<ScoreModel>? students})
      : _strands = strands,
        _students = students;

  factory _$StrandStudentMasteryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrandStudentMasteryModelImplFromJson(json);

  final List<String>? _strands;
  @override
  List<String>? get strands {
    final value = _strands;
    if (value == null) return null;
    if (_strands is EqualUnmodifiableListView) return _strands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _students;
  @override
  List<ScoreModel>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StrandStudentMasteryModel(strands: $strands, students: $students)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrandStudentMasteryModelImpl &&
            const DeepCollectionEquality().equals(other._strands, _strands) &&
            const DeepCollectionEquality().equals(other._students, _students));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_strands),
      const DeepCollectionEquality().hash(_students));

  /// Create a copy of StrandStudentMasteryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrandStudentMasteryModelImplCopyWith<_$StrandStudentMasteryModelImpl>
      get copyWith => __$$StrandStudentMasteryModelImplCopyWithImpl<
          _$StrandStudentMasteryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrandStudentMasteryModelImplToJson(
      this,
    );
  }
}

abstract class _StrandStudentMasteryModel implements StrandStudentMasteryModel {
  factory _StrandStudentMasteryModel(
      {final List<String>? strands,
      final List<ScoreModel>? students}) = _$StrandStudentMasteryModelImpl;

  factory _StrandStudentMasteryModel.fromJson(Map<String, dynamic> json) =
      _$StrandStudentMasteryModelImpl.fromJson;

  @override
  List<String>? get strands;
  @override
  List<ScoreModel>? get students;

  /// Create a copy of StrandStudentMasteryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrandStudentMasteryModelImplCopyWith<_$StrandStudentMasteryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlaggedSubStrandModel _$FlaggedSubStrandModelFromJson(
    Map<String, dynamic> json) {
  return _FlaggedSubStrandModel.fromJson(json);
}

/// @nodoc
mixin _$FlaggedSubStrandModel {
  List<String>? get pair => throw _privateConstructorUsedError;
  double? get correlation => throw _privateConstructorUsedError;
  String? get insight => throw _privateConstructorUsedError;
  String? get suggestion => throw _privateConstructorUsedError;

  /// Serializes this FlaggedSubStrandModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlaggedSubStrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlaggedSubStrandModelCopyWith<FlaggedSubStrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlaggedSubStrandModelCopyWith<$Res> {
  factory $FlaggedSubStrandModelCopyWith(FlaggedSubStrandModel value,
          $Res Function(FlaggedSubStrandModel) then) =
      _$FlaggedSubStrandModelCopyWithImpl<$Res, FlaggedSubStrandModel>;
  @useResult
  $Res call(
      {List<String>? pair,
      double? correlation,
      String? insight,
      String? suggestion});
}

/// @nodoc
class _$FlaggedSubStrandModelCopyWithImpl<$Res,
        $Val extends FlaggedSubStrandModel>
    implements $FlaggedSubStrandModelCopyWith<$Res> {
  _$FlaggedSubStrandModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlaggedSubStrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pair = freezed,
    Object? correlation = freezed,
    Object? insight = freezed,
    Object? suggestion = freezed,
  }) {
    return _then(_value.copyWith(
      pair: freezed == pair
          ? _value.pair
          : pair // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      correlation: freezed == correlation
          ? _value.correlation
          : correlation // ignore: cast_nullable_to_non_nullable
              as double?,
      insight: freezed == insight
          ? _value.insight
          : insight // ignore: cast_nullable_to_non_nullable
              as String?,
      suggestion: freezed == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlaggedSubStrandModelImplCopyWith<$Res>
    implements $FlaggedSubStrandModelCopyWith<$Res> {
  factory _$$FlaggedSubStrandModelImplCopyWith(
          _$FlaggedSubStrandModelImpl value,
          $Res Function(_$FlaggedSubStrandModelImpl) then) =
      __$$FlaggedSubStrandModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? pair,
      double? correlation,
      String? insight,
      String? suggestion});
}

/// @nodoc
class __$$FlaggedSubStrandModelImplCopyWithImpl<$Res>
    extends _$FlaggedSubStrandModelCopyWithImpl<$Res,
        _$FlaggedSubStrandModelImpl>
    implements _$$FlaggedSubStrandModelImplCopyWith<$Res> {
  __$$FlaggedSubStrandModelImplCopyWithImpl(_$FlaggedSubStrandModelImpl _value,
      $Res Function(_$FlaggedSubStrandModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlaggedSubStrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pair = freezed,
    Object? correlation = freezed,
    Object? insight = freezed,
    Object? suggestion = freezed,
  }) {
    return _then(_$FlaggedSubStrandModelImpl(
      pair: freezed == pair
          ? _value._pair
          : pair // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      correlation: freezed == correlation
          ? _value.correlation
          : correlation // ignore: cast_nullable_to_non_nullable
              as double?,
      insight: freezed == insight
          ? _value.insight
          : insight // ignore: cast_nullable_to_non_nullable
              as String?,
      suggestion: freezed == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlaggedSubStrandModelImpl implements _FlaggedSubStrandModel {
  _$FlaggedSubStrandModelImpl(
      {final List<String>? pair,
      this.correlation,
      this.insight,
      this.suggestion})
      : _pair = pair;

  factory _$FlaggedSubStrandModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlaggedSubStrandModelImplFromJson(json);

  final List<String>? _pair;
  @override
  List<String>? get pair {
    final value = _pair;
    if (value == null) return null;
    if (_pair is EqualUnmodifiableListView) return _pair;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? correlation;
  @override
  final String? insight;
  @override
  final String? suggestion;

  @override
  String toString() {
    return 'FlaggedSubStrandModel(pair: $pair, correlation: $correlation, insight: $insight, suggestion: $suggestion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlaggedSubStrandModelImpl &&
            const DeepCollectionEquality().equals(other._pair, _pair) &&
            (identical(other.correlation, correlation) ||
                other.correlation == correlation) &&
            (identical(other.insight, insight) || other.insight == insight) &&
            (identical(other.suggestion, suggestion) ||
                other.suggestion == suggestion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pair),
      correlation,
      insight,
      suggestion);

  /// Create a copy of FlaggedSubStrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlaggedSubStrandModelImplCopyWith<_$FlaggedSubStrandModelImpl>
      get copyWith => __$$FlaggedSubStrandModelImplCopyWithImpl<
          _$FlaggedSubStrandModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlaggedSubStrandModelImplToJson(
      this,
    );
  }
}

abstract class _FlaggedSubStrandModel implements FlaggedSubStrandModel {
  factory _FlaggedSubStrandModel(
      {final List<String>? pair,
      final double? correlation,
      final String? insight,
      final String? suggestion}) = _$FlaggedSubStrandModelImpl;

  factory _FlaggedSubStrandModel.fromJson(Map<String, dynamic> json) =
      _$FlaggedSubStrandModelImpl.fromJson;

  @override
  List<String>? get pair;
  @override
  double? get correlation;
  @override
  String? get insight;
  @override
  String? get suggestion;

  /// Create a copy of FlaggedSubStrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlaggedSubStrandModelImplCopyWith<_$FlaggedSubStrandModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentExamSessionPerformanceModel _$StudentExamSessionPerformanceModelFromJson(
    Map<String, dynamic> json) {
  return _StudentExamSessionPerformanceModel.fromJson(json);
}

/// @nodoc
mixin _$StudentExamSessionPerformanceModel {
  int? get id => throw _privateConstructorUsedError;
  double? get avg_score => throw _privateConstructorUsedError;
  List<ScoreModel>? get grade_scores => throw _privateConstructorUsedError;
  List<ScoreModel>? get bloom_skill_scores =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get strand_scores => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;
  StudentExamSessionModel? get session => throw _privateConstructorUsedError;
  List<StudentAnswerModel>? get answers => throw _privateConstructorUsedError;

  /// Serializes this StudentExamSessionPerformanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentExamSessionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentExamSessionPerformanceModelCopyWith<
          StudentExamSessionPerformanceModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentExamSessionPerformanceModelCopyWith<$Res> {
  factory $StudentExamSessionPerformanceModelCopyWith(
          StudentExamSessionPerformanceModel value,
          $Res Function(StudentExamSessionPerformanceModel) then) =
      _$StudentExamSessionPerformanceModelCopyWithImpl<$Res,
          StudentExamSessionPerformanceModel>;
  @useResult
  $Res call(
      {int? id,
      double? avg_score,
      List<ScoreModel>? grade_scores,
      List<ScoreModel>? bloom_skill_scores,
      List<ScoreModel>? strand_scores,
      DateTime? created_at,
      DateTime? updated_at,
      StudentExamSessionModel? session,
      List<StudentAnswerModel>? answers});

  $StudentExamSessionModelCopyWith<$Res>? get session;
}

/// @nodoc
class _$StudentExamSessionPerformanceModelCopyWithImpl<$Res,
        $Val extends StudentExamSessionPerformanceModel>
    implements $StudentExamSessionPerformanceModelCopyWith<$Res> {
  _$StudentExamSessionPerformanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentExamSessionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? avg_score = freezed,
    Object? grade_scores = freezed,
    Object? bloom_skill_scores = freezed,
    Object? strand_scores = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? session = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      grade_scores: freezed == grade_scores
          ? _value.grade_scores
          : grade_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      bloom_skill_scores: freezed == bloom_skill_scores
          ? _value.bloom_skill_scores
          : bloom_skill_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      strand_scores: freezed == strand_scores
          ? _value.strand_scores
          : strand_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as StudentExamSessionModel?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<StudentAnswerModel>?,
    ) as $Val);
  }

  /// Create a copy of StudentExamSessionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudentExamSessionModelCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $StudentExamSessionModelCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentExamSessionPerformanceModelImplCopyWith<$Res>
    implements $StudentExamSessionPerformanceModelCopyWith<$Res> {
  factory _$$StudentExamSessionPerformanceModelImplCopyWith(
          _$StudentExamSessionPerformanceModelImpl value,
          $Res Function(_$StudentExamSessionPerformanceModelImpl) then) =
      __$$StudentExamSessionPerformanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      double? avg_score,
      List<ScoreModel>? grade_scores,
      List<ScoreModel>? bloom_skill_scores,
      List<ScoreModel>? strand_scores,
      DateTime? created_at,
      DateTime? updated_at,
      StudentExamSessionModel? session,
      List<StudentAnswerModel>? answers});

  @override
  $StudentExamSessionModelCopyWith<$Res>? get session;
}

/// @nodoc
class __$$StudentExamSessionPerformanceModelImplCopyWithImpl<$Res>
    extends _$StudentExamSessionPerformanceModelCopyWithImpl<$Res,
        _$StudentExamSessionPerformanceModelImpl>
    implements _$$StudentExamSessionPerformanceModelImplCopyWith<$Res> {
  __$$StudentExamSessionPerformanceModelImplCopyWithImpl(
      _$StudentExamSessionPerformanceModelImpl _value,
      $Res Function(_$StudentExamSessionPerformanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentExamSessionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? avg_score = freezed,
    Object? grade_scores = freezed,
    Object? bloom_skill_scores = freezed,
    Object? strand_scores = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? session = freezed,
    Object? answers = freezed,
  }) {
    return _then(_$StudentExamSessionPerformanceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      grade_scores: freezed == grade_scores
          ? _value._grade_scores
          : grade_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      bloom_skill_scores: freezed == bloom_skill_scores
          ? _value._bloom_skill_scores
          : bloom_skill_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      strand_scores: freezed == strand_scores
          ? _value._strand_scores
          : strand_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as StudentExamSessionModel?,
      answers: freezed == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<StudentAnswerModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentExamSessionPerformanceModelImpl
    implements _StudentExamSessionPerformanceModel {
  _$StudentExamSessionPerformanceModelImpl(
      {this.id,
      this.avg_score,
      final List<ScoreModel>? grade_scores,
      final List<ScoreModel>? bloom_skill_scores,
      final List<ScoreModel>? strand_scores,
      this.created_at,
      this.updated_at,
      this.session,
      final List<StudentAnswerModel>? answers})
      : _grade_scores = grade_scores,
        _bloom_skill_scores = bloom_skill_scores,
        _strand_scores = strand_scores,
        _answers = answers;

  factory _$StudentExamSessionPerformanceModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$StudentExamSessionPerformanceModelImplFromJson(json);

  @override
  final int? id;
  @override
  final double? avg_score;
  final List<ScoreModel>? _grade_scores;
  @override
  List<ScoreModel>? get grade_scores {
    final value = _grade_scores;
    if (value == null) return null;
    if (_grade_scores is EqualUnmodifiableListView) return _grade_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _bloom_skill_scores;
  @override
  List<ScoreModel>? get bloom_skill_scores {
    final value = _bloom_skill_scores;
    if (value == null) return null;
    if (_bloom_skill_scores is EqualUnmodifiableListView)
      return _bloom_skill_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _strand_scores;
  @override
  List<ScoreModel>? get strand_scores {
    final value = _strand_scores;
    if (value == null) return null;
    if (_strand_scores is EqualUnmodifiableListView) return _strand_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;
  @override
  final StudentExamSessionModel? session;
  final List<StudentAnswerModel>? _answers;
  @override
  List<StudentAnswerModel>? get answers {
    final value = _answers;
    if (value == null) return null;
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StudentExamSessionPerformanceModel(id: $id, avg_score: $avg_score, grade_scores: $grade_scores, bloom_skill_scores: $bloom_skill_scores, strand_scores: $strand_scores, created_at: $created_at, updated_at: $updated_at, session: $session, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentExamSessionPerformanceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avg_score, avg_score) ||
                other.avg_score == avg_score) &&
            const DeepCollectionEquality()
                .equals(other._grade_scores, _grade_scores) &&
            const DeepCollectionEquality()
                .equals(other._bloom_skill_scores, _bloom_skill_scores) &&
            const DeepCollectionEquality()
                .equals(other._strand_scores, _strand_scores) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.session, session) || other.session == session) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      avg_score,
      const DeepCollectionEquality().hash(_grade_scores),
      const DeepCollectionEquality().hash(_bloom_skill_scores),
      const DeepCollectionEquality().hash(_strand_scores),
      created_at,
      updated_at,
      session,
      const DeepCollectionEquality().hash(_answers));

  /// Create a copy of StudentExamSessionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentExamSessionPerformanceModelImplCopyWith<
          _$StudentExamSessionPerformanceModelImpl>
      get copyWith => __$$StudentExamSessionPerformanceModelImplCopyWithImpl<
          _$StudentExamSessionPerformanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentExamSessionPerformanceModelImplToJson(
      this,
    );
  }
}

abstract class _StudentExamSessionPerformanceModel
    implements StudentExamSessionPerformanceModel {
  factory _StudentExamSessionPerformanceModel(
          {final int? id,
          final double? avg_score,
          final List<ScoreModel>? grade_scores,
          final List<ScoreModel>? bloom_skill_scores,
          final List<ScoreModel>? strand_scores,
          final DateTime? created_at,
          final DateTime? updated_at,
          final StudentExamSessionModel? session,
          final List<StudentAnswerModel>? answers}) =
      _$StudentExamSessionPerformanceModelImpl;

  factory _StudentExamSessionPerformanceModel.fromJson(
          Map<String, dynamic> json) =
      _$StudentExamSessionPerformanceModelImpl.fromJson;

  @override
  int? get id;
  @override
  double? get avg_score;
  @override
  List<ScoreModel>? get grade_scores;
  @override
  List<ScoreModel>? get bloom_skill_scores;
  @override
  List<ScoreModel>? get strand_scores;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;
  @override
  StudentExamSessionModel? get session;
  @override
  List<StudentAnswerModel>? get answers;

  /// Create a copy of StudentExamSessionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentExamSessionPerformanceModelImplCopyWith<
          _$StudentExamSessionPerformanceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClassExamPerfClusterModel _$ClassExamPerfClusterModelFromJson(
    Map<String, dynamic> json) {
  return _ClassExamPerfClusterModel.fromJson(json);
}

/// @nodoc
mixin _$ClassExamPerfClusterModel {
  int? get id => throw _privateConstructorUsedError;
  int? get exam => throw _privateConstructorUsedError;
  String? get cluster_label => throw _privateConstructorUsedError;
  int? get cluster_size => throw _privateConstructorUsedError;
  double? get avg_score => throw _privateConstructorUsedError;
  String? get avg_expectation_level => throw _privateConstructorUsedError;
  List<ExamModel>? get student_sessions => throw _privateConstructorUsedError;
  ScoreModel? get score_variance => throw _privateConstructorUsedError;
  List<ScoreModel>? get bloom_skill_scores =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get strand_scores => throw _privateConstructorUsedError;
  List<ScoreModel>? get top_best_questions =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get top_worst_questions =>
      throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;
  int? get follow_up_exam_id => throw _privateConstructorUsedError;

  /// Serializes this ClassExamPerfClusterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassExamPerfClusterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassExamPerfClusterModelCopyWith<ClassExamPerfClusterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassExamPerfClusterModelCopyWith<$Res> {
  factory $ClassExamPerfClusterModelCopyWith(ClassExamPerfClusterModel value,
          $Res Function(ClassExamPerfClusterModel) then) =
      _$ClassExamPerfClusterModelCopyWithImpl<$Res, ClassExamPerfClusterModel>;
  @useResult
  $Res call(
      {int? id,
      int? exam,
      String? cluster_label,
      int? cluster_size,
      double? avg_score,
      String? avg_expectation_level,
      List<ExamModel>? student_sessions,
      ScoreModel? score_variance,
      List<ScoreModel>? bloom_skill_scores,
      List<ScoreModel>? strand_scores,
      List<ScoreModel>? top_best_questions,
      List<ScoreModel>? top_worst_questions,
      DateTime? created_at,
      DateTime? updated_at,
      int? follow_up_exam_id});

  $ScoreModelCopyWith<$Res>? get score_variance;
}

/// @nodoc
class _$ClassExamPerfClusterModelCopyWithImpl<$Res,
        $Val extends ClassExamPerfClusterModel>
    implements $ClassExamPerfClusterModelCopyWith<$Res> {
  _$ClassExamPerfClusterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassExamPerfClusterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exam = freezed,
    Object? cluster_label = freezed,
    Object? cluster_size = freezed,
    Object? avg_score = freezed,
    Object? avg_expectation_level = freezed,
    Object? student_sessions = freezed,
    Object? score_variance = freezed,
    Object? bloom_skill_scores = freezed,
    Object? strand_scores = freezed,
    Object? top_best_questions = freezed,
    Object? top_worst_questions = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? follow_up_exam_id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      exam: freezed == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as int?,
      cluster_label: freezed == cluster_label
          ? _value.cluster_label
          : cluster_label // ignore: cast_nullable_to_non_nullable
              as String?,
      cluster_size: freezed == cluster_size
          ? _value.cluster_size
          : cluster_size // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_expectation_level: freezed == avg_expectation_level
          ? _value.avg_expectation_level
          : avg_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      student_sessions: freezed == student_sessions
          ? _value.student_sessions
          : student_sessions // ignore: cast_nullable_to_non_nullable
              as List<ExamModel>?,
      score_variance: freezed == score_variance
          ? _value.score_variance
          : score_variance // ignore: cast_nullable_to_non_nullable
              as ScoreModel?,
      bloom_skill_scores: freezed == bloom_skill_scores
          ? _value.bloom_skill_scores
          : bloom_skill_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      strand_scores: freezed == strand_scores
          ? _value.strand_scores
          : strand_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      top_best_questions: freezed == top_best_questions
          ? _value.top_best_questions
          : top_best_questions // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      top_worst_questions: freezed == top_worst_questions
          ? _value.top_worst_questions
          : top_worst_questions // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      follow_up_exam_id: freezed == follow_up_exam_id
          ? _value.follow_up_exam_id
          : follow_up_exam_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ClassExamPerfClusterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScoreModelCopyWith<$Res>? get score_variance {
    if (_value.score_variance == null) {
      return null;
    }

    return $ScoreModelCopyWith<$Res>(_value.score_variance!, (value) {
      return _then(_value.copyWith(score_variance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClassExamPerfClusterModelImplCopyWith<$Res>
    implements $ClassExamPerfClusterModelCopyWith<$Res> {
  factory _$$ClassExamPerfClusterModelImplCopyWith(
          _$ClassExamPerfClusterModelImpl value,
          $Res Function(_$ClassExamPerfClusterModelImpl) then) =
      __$$ClassExamPerfClusterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? exam,
      String? cluster_label,
      int? cluster_size,
      double? avg_score,
      String? avg_expectation_level,
      List<ExamModel>? student_sessions,
      ScoreModel? score_variance,
      List<ScoreModel>? bloom_skill_scores,
      List<ScoreModel>? strand_scores,
      List<ScoreModel>? top_best_questions,
      List<ScoreModel>? top_worst_questions,
      DateTime? created_at,
      DateTime? updated_at,
      int? follow_up_exam_id});

  @override
  $ScoreModelCopyWith<$Res>? get score_variance;
}

/// @nodoc
class __$$ClassExamPerfClusterModelImplCopyWithImpl<$Res>
    extends _$ClassExamPerfClusterModelCopyWithImpl<$Res,
        _$ClassExamPerfClusterModelImpl>
    implements _$$ClassExamPerfClusterModelImplCopyWith<$Res> {
  __$$ClassExamPerfClusterModelImplCopyWithImpl(
      _$ClassExamPerfClusterModelImpl _value,
      $Res Function(_$ClassExamPerfClusterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassExamPerfClusterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exam = freezed,
    Object? cluster_label = freezed,
    Object? cluster_size = freezed,
    Object? avg_score = freezed,
    Object? avg_expectation_level = freezed,
    Object? student_sessions = freezed,
    Object? score_variance = freezed,
    Object? bloom_skill_scores = freezed,
    Object? strand_scores = freezed,
    Object? top_best_questions = freezed,
    Object? top_worst_questions = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? follow_up_exam_id = freezed,
  }) {
    return _then(_$ClassExamPerfClusterModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      exam: freezed == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as int?,
      cluster_label: freezed == cluster_label
          ? _value.cluster_label
          : cluster_label // ignore: cast_nullable_to_non_nullable
              as String?,
      cluster_size: freezed == cluster_size
          ? _value.cluster_size
          : cluster_size // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_expectation_level: freezed == avg_expectation_level
          ? _value.avg_expectation_level
          : avg_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      student_sessions: freezed == student_sessions
          ? _value._student_sessions
          : student_sessions // ignore: cast_nullable_to_non_nullable
              as List<ExamModel>?,
      score_variance: freezed == score_variance
          ? _value.score_variance
          : score_variance // ignore: cast_nullable_to_non_nullable
              as ScoreModel?,
      bloom_skill_scores: freezed == bloom_skill_scores
          ? _value._bloom_skill_scores
          : bloom_skill_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      strand_scores: freezed == strand_scores
          ? _value._strand_scores
          : strand_scores // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      top_best_questions: freezed == top_best_questions
          ? _value._top_best_questions
          : top_best_questions // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      top_worst_questions: freezed == top_worst_questions
          ? _value._top_worst_questions
          : top_worst_questions // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      follow_up_exam_id: freezed == follow_up_exam_id
          ? _value.follow_up_exam_id
          : follow_up_exam_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassExamPerfClusterModelImpl implements _ClassExamPerfClusterModel {
  _$ClassExamPerfClusterModelImpl(
      {this.id,
      this.exam,
      this.cluster_label,
      this.cluster_size,
      this.avg_score,
      this.avg_expectation_level,
      final List<ExamModel>? student_sessions,
      this.score_variance,
      final List<ScoreModel>? bloom_skill_scores,
      final List<ScoreModel>? strand_scores,
      final List<ScoreModel>? top_best_questions,
      final List<ScoreModel>? top_worst_questions,
      this.created_at,
      this.updated_at,
      this.follow_up_exam_id})
      : _student_sessions = student_sessions,
        _bloom_skill_scores = bloom_skill_scores,
        _strand_scores = strand_scores,
        _top_best_questions = top_best_questions,
        _top_worst_questions = top_worst_questions;

  factory _$ClassExamPerfClusterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassExamPerfClusterModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? exam;
  @override
  final String? cluster_label;
  @override
  final int? cluster_size;
  @override
  final double? avg_score;
  @override
  final String? avg_expectation_level;
  final List<ExamModel>? _student_sessions;
  @override
  List<ExamModel>? get student_sessions {
    final value = _student_sessions;
    if (value == null) return null;
    if (_student_sessions is EqualUnmodifiableListView)
      return _student_sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ScoreModel? score_variance;
  final List<ScoreModel>? _bloom_skill_scores;
  @override
  List<ScoreModel>? get bloom_skill_scores {
    final value = _bloom_skill_scores;
    if (value == null) return null;
    if (_bloom_skill_scores is EqualUnmodifiableListView)
      return _bloom_skill_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _strand_scores;
  @override
  List<ScoreModel>? get strand_scores {
    final value = _strand_scores;
    if (value == null) return null;
    if (_strand_scores is EqualUnmodifiableListView) return _strand_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _top_best_questions;
  @override
  List<ScoreModel>? get top_best_questions {
    final value = _top_best_questions;
    if (value == null) return null;
    if (_top_best_questions is EqualUnmodifiableListView)
      return _top_best_questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _top_worst_questions;
  @override
  List<ScoreModel>? get top_worst_questions {
    final value = _top_worst_questions;
    if (value == null) return null;
    if (_top_worst_questions is EqualUnmodifiableListView)
      return _top_worst_questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;
  @override
  final int? follow_up_exam_id;

  @override
  String toString() {
    return 'ClassExamPerfClusterModel(id: $id, exam: $exam, cluster_label: $cluster_label, cluster_size: $cluster_size, avg_score: $avg_score, avg_expectation_level: $avg_expectation_level, student_sessions: $student_sessions, score_variance: $score_variance, bloom_skill_scores: $bloom_skill_scores, strand_scores: $strand_scores, top_best_questions: $top_best_questions, top_worst_questions: $top_worst_questions, created_at: $created_at, updated_at: $updated_at, follow_up_exam_id: $follow_up_exam_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassExamPerfClusterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.cluster_label, cluster_label) ||
                other.cluster_label == cluster_label) &&
            (identical(other.cluster_size, cluster_size) ||
                other.cluster_size == cluster_size) &&
            (identical(other.avg_score, avg_score) ||
                other.avg_score == avg_score) &&
            (identical(other.avg_expectation_level, avg_expectation_level) ||
                other.avg_expectation_level == avg_expectation_level) &&
            const DeepCollectionEquality()
                .equals(other._student_sessions, _student_sessions) &&
            (identical(other.score_variance, score_variance) ||
                other.score_variance == score_variance) &&
            const DeepCollectionEquality()
                .equals(other._bloom_skill_scores, _bloom_skill_scores) &&
            const DeepCollectionEquality()
                .equals(other._strand_scores, _strand_scores) &&
            const DeepCollectionEquality()
                .equals(other._top_best_questions, _top_best_questions) &&
            const DeepCollectionEquality()
                .equals(other._top_worst_questions, _top_worst_questions) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.follow_up_exam_id, follow_up_exam_id) ||
                other.follow_up_exam_id == follow_up_exam_id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      exam,
      cluster_label,
      cluster_size,
      avg_score,
      avg_expectation_level,
      const DeepCollectionEquality().hash(_student_sessions),
      score_variance,
      const DeepCollectionEquality().hash(_bloom_skill_scores),
      const DeepCollectionEquality().hash(_strand_scores),
      const DeepCollectionEquality().hash(_top_best_questions),
      const DeepCollectionEquality().hash(_top_worst_questions),
      created_at,
      updated_at,
      follow_up_exam_id);

  /// Create a copy of ClassExamPerfClusterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassExamPerfClusterModelImplCopyWith<_$ClassExamPerfClusterModelImpl>
      get copyWith => __$$ClassExamPerfClusterModelImplCopyWithImpl<
          _$ClassExamPerfClusterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassExamPerfClusterModelImplToJson(
      this,
    );
  }
}

abstract class _ClassExamPerfClusterModel implements ClassExamPerfClusterModel {
  factory _ClassExamPerfClusterModel(
      {final int? id,
      final int? exam,
      final String? cluster_label,
      final int? cluster_size,
      final double? avg_score,
      final String? avg_expectation_level,
      final List<ExamModel>? student_sessions,
      final ScoreModel? score_variance,
      final List<ScoreModel>? bloom_skill_scores,
      final List<ScoreModel>? strand_scores,
      final List<ScoreModel>? top_best_questions,
      final List<ScoreModel>? top_worst_questions,
      final DateTime? created_at,
      final DateTime? updated_at,
      final int? follow_up_exam_id}) = _$ClassExamPerfClusterModelImpl;

  factory _ClassExamPerfClusterModel.fromJson(Map<String, dynamic> json) =
      _$ClassExamPerfClusterModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get exam;
  @override
  String? get cluster_label;
  @override
  int? get cluster_size;
  @override
  double? get avg_score;
  @override
  String? get avg_expectation_level;
  @override
  List<ExamModel>? get student_sessions;
  @override
  ScoreModel? get score_variance;
  @override
  List<ScoreModel>? get bloom_skill_scores;
  @override
  List<ScoreModel>? get strand_scores;
  @override
  List<ScoreModel>? get top_best_questions;
  @override
  List<ScoreModel>? get top_worst_questions;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;
  @override
  int? get follow_up_exam_id;

  /// Create a copy of ClassExamPerfClusterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassExamPerfClusterModelImplCopyWith<_$ClassExamPerfClusterModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ExamQuestionPerformanceModel _$ExamQuestionPerformanceModelFromJson(
    Map<String, dynamic> json) {
  return _ExamQuestionPerformanceModel.fromJson(json);
}

/// @nodoc
mixin _$ExamQuestionPerformanceModel {
  int? get question_id => throw _privateConstructorUsedError;
  double? get avg_score => throw _privateConstructorUsedError;
  String? get avg_expectation_level => throw _privateConstructorUsedError;
  List<ScoreModel>? get score_distribution =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get answers_by_level => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;

  /// Serializes this ExamQuestionPerformanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamQuestionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamQuestionPerformanceModelCopyWith<ExamQuestionPerformanceModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamQuestionPerformanceModelCopyWith<$Res> {
  factory $ExamQuestionPerformanceModelCopyWith(
          ExamQuestionPerformanceModel value,
          $Res Function(ExamQuestionPerformanceModel) then) =
      _$ExamQuestionPerformanceModelCopyWithImpl<$Res,
          ExamQuestionPerformanceModel>;
  @useResult
  $Res call(
      {int? question_id,
      double? avg_score,
      String? avg_expectation_level,
      List<ScoreModel>? score_distribution,
      List<ScoreModel>? answers_by_level,
      DateTime? created_at,
      DateTime? updated_at});
}

/// @nodoc
class _$ExamQuestionPerformanceModelCopyWithImpl<$Res,
        $Val extends ExamQuestionPerformanceModel>
    implements $ExamQuestionPerformanceModelCopyWith<$Res> {
  _$ExamQuestionPerformanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamQuestionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question_id = freezed,
    Object? avg_score = freezed,
    Object? avg_expectation_level = freezed,
    Object? score_distribution = freezed,
    Object? answers_by_level = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_value.copyWith(
      question_id: freezed == question_id
          ? _value.question_id
          : question_id // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_expectation_level: freezed == avg_expectation_level
          ? _value.avg_expectation_level
          : avg_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      score_distribution: freezed == score_distribution
          ? _value.score_distribution
          : score_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      answers_by_level: freezed == answers_by_level
          ? _value.answers_by_level
          : answers_by_level // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamQuestionPerformanceModelImplCopyWith<$Res>
    implements $ExamQuestionPerformanceModelCopyWith<$Res> {
  factory _$$ExamQuestionPerformanceModelImplCopyWith(
          _$ExamQuestionPerformanceModelImpl value,
          $Res Function(_$ExamQuestionPerformanceModelImpl) then) =
      __$$ExamQuestionPerformanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? question_id,
      double? avg_score,
      String? avg_expectation_level,
      List<ScoreModel>? score_distribution,
      List<ScoreModel>? answers_by_level,
      DateTime? created_at,
      DateTime? updated_at});
}

/// @nodoc
class __$$ExamQuestionPerformanceModelImplCopyWithImpl<$Res>
    extends _$ExamQuestionPerformanceModelCopyWithImpl<$Res,
        _$ExamQuestionPerformanceModelImpl>
    implements _$$ExamQuestionPerformanceModelImplCopyWith<$Res> {
  __$$ExamQuestionPerformanceModelImplCopyWithImpl(
      _$ExamQuestionPerformanceModelImpl _value,
      $Res Function(_$ExamQuestionPerformanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamQuestionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question_id = freezed,
    Object? avg_score = freezed,
    Object? avg_expectation_level = freezed,
    Object? score_distribution = freezed,
    Object? answers_by_level = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_$ExamQuestionPerformanceModelImpl(
      question_id: freezed == question_id
          ? _value.question_id
          : question_id // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_expectation_level: freezed == avg_expectation_level
          ? _value.avg_expectation_level
          : avg_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      score_distribution: freezed == score_distribution
          ? _value._score_distribution
          : score_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      answers_by_level: freezed == answers_by_level
          ? _value._answers_by_level
          : answers_by_level // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamQuestionPerformanceModelImpl
    implements _ExamQuestionPerformanceModel {
  _$ExamQuestionPerformanceModelImpl(
      {this.question_id,
      this.avg_score,
      this.avg_expectation_level,
      final List<ScoreModel>? score_distribution,
      final List<ScoreModel>? answers_by_level,
      this.created_at,
      this.updated_at})
      : _score_distribution = score_distribution,
        _answers_by_level = answers_by_level;

  factory _$ExamQuestionPerformanceModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ExamQuestionPerformanceModelImplFromJson(json);

  @override
  final int? question_id;
  @override
  final double? avg_score;
  @override
  final String? avg_expectation_level;
  final List<ScoreModel>? _score_distribution;
  @override
  List<ScoreModel>? get score_distribution {
    final value = _score_distribution;
    if (value == null) return null;
    if (_score_distribution is EqualUnmodifiableListView)
      return _score_distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _answers_by_level;
  @override
  List<ScoreModel>? get answers_by_level {
    final value = _answers_by_level;
    if (value == null) return null;
    if (_answers_by_level is EqualUnmodifiableListView)
      return _answers_by_level;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;

  @override
  String toString() {
    return 'ExamQuestionPerformanceModel(question_id: $question_id, avg_score: $avg_score, avg_expectation_level: $avg_expectation_level, score_distribution: $score_distribution, answers_by_level: $answers_by_level, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamQuestionPerformanceModelImpl &&
            (identical(other.question_id, question_id) ||
                other.question_id == question_id) &&
            (identical(other.avg_score, avg_score) ||
                other.avg_score == avg_score) &&
            (identical(other.avg_expectation_level, avg_expectation_level) ||
                other.avg_expectation_level == avg_expectation_level) &&
            const DeepCollectionEquality()
                .equals(other._score_distribution, _score_distribution) &&
            const DeepCollectionEquality()
                .equals(other._answers_by_level, _answers_by_level) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      question_id,
      avg_score,
      avg_expectation_level,
      const DeepCollectionEquality().hash(_score_distribution),
      const DeepCollectionEquality().hash(_answers_by_level),
      created_at,
      updated_at);

  /// Create a copy of ExamQuestionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamQuestionPerformanceModelImplCopyWith<
          _$ExamQuestionPerformanceModelImpl>
      get copyWith => __$$ExamQuestionPerformanceModelImplCopyWithImpl<
          _$ExamQuestionPerformanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamQuestionPerformanceModelImplToJson(
      this,
    );
  }
}

abstract class _ExamQuestionPerformanceModel
    implements ExamQuestionPerformanceModel {
  factory _ExamQuestionPerformanceModel(
      {final int? question_id,
      final double? avg_score,
      final String? avg_expectation_level,
      final List<ScoreModel>? score_distribution,
      final List<ScoreModel>? answers_by_level,
      final DateTime? created_at,
      final DateTime? updated_at}) = _$ExamQuestionPerformanceModelImpl;

  factory _ExamQuestionPerformanceModel.fromJson(Map<String, dynamic> json) =
      _$ExamQuestionPerformanceModelImpl.fromJson;

  @override
  int? get question_id;
  @override
  double? get avg_score;
  @override
  String? get avg_expectation_level;
  @override
  List<ScoreModel>? get score_distribution;
  @override
  List<ScoreModel>? get answers_by_level;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;

  /// Create a copy of ExamQuestionPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamQuestionPerformanceModelImplCopyWith<
          _$ExamQuestionPerformanceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
