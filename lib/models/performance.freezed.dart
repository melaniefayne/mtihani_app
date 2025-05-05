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
  double? get avg_score => throw _privateConstructorUsedError;
  List<ScoreModel>? get grade_scores => throw _privateConstructorUsedError;
  List<ScoreModel>? get bloom_skill_scores =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get strand_scores => throw _privateConstructorUsedError;
  ExamModel? get exam => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;
  ClassroomModel? get classroom => throw _privateConstructorUsedError;

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
      {double? avg_score,
      List<ScoreModel>? grade_scores,
      List<ScoreModel>? bloom_skill_scores,
      List<ScoreModel>? strand_scores,
      ExamModel? exam,
      DateTime? created_at,
      DateTime? updated_at,
      ClassroomModel? classroom});

  $ExamModelCopyWith<$Res>? get exam;
  $ClassroomModelCopyWith<$Res>? get classroom;
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
    Object? avg_score = freezed,
    Object? grade_scores = freezed,
    Object? bloom_skill_scores = freezed,
    Object? strand_scores = freezed,
    Object? exam = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? classroom = freezed,
  }) {
    return _then(_value.copyWith(
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
      exam: freezed == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamModel?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      classroom: freezed == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as ClassroomModel?,
    ) as $Val);
  }

  /// Create a copy of ClassExamPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExamModelCopyWith<$Res>? get exam {
    if (_value.exam == null) {
      return null;
    }

    return $ExamModelCopyWith<$Res>(_value.exam!, (value) {
      return _then(_value.copyWith(exam: value) as $Val);
    });
  }

  /// Create a copy of ClassExamPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassroomModelCopyWith<$Res>? get classroom {
    if (_value.classroom == null) {
      return null;
    }

    return $ClassroomModelCopyWith<$Res>(_value.classroom!, (value) {
      return _then(_value.copyWith(classroom: value) as $Val);
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
      {double? avg_score,
      List<ScoreModel>? grade_scores,
      List<ScoreModel>? bloom_skill_scores,
      List<ScoreModel>? strand_scores,
      ExamModel? exam,
      DateTime? created_at,
      DateTime? updated_at,
      ClassroomModel? classroom});

  @override
  $ExamModelCopyWith<$Res>? get exam;
  @override
  $ClassroomModelCopyWith<$Res>? get classroom;
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
    Object? avg_score = freezed,
    Object? grade_scores = freezed,
    Object? bloom_skill_scores = freezed,
    Object? strand_scores = freezed,
    Object? exam = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? classroom = freezed,
  }) {
    return _then(_$ClassExamPerformanceModelImpl(
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
      exam: freezed == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamModel?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      classroom: freezed == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as ClassroomModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassExamPerformanceModelImpl implements _ClassExamPerformanceModel {
  _$ClassExamPerformanceModelImpl(
      {this.avg_score,
      final List<ScoreModel>? grade_scores,
      final List<ScoreModel>? bloom_skill_scores,
      final List<ScoreModel>? strand_scores,
      this.exam,
      this.created_at,
      this.updated_at,
      this.classroom})
      : _grade_scores = grade_scores,
        _bloom_skill_scores = bloom_skill_scores,
        _strand_scores = strand_scores;

  factory _$ClassExamPerformanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassExamPerformanceModelImplFromJson(json);

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
  final ExamModel? exam;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;
  @override
  final ClassroomModel? classroom;

  @override
  String toString() {
    return 'ClassExamPerformanceModel(avg_score: $avg_score, grade_scores: $grade_scores, bloom_skill_scores: $bloom_skill_scores, strand_scores: $strand_scores, exam: $exam, created_at: $created_at, updated_at: $updated_at, classroom: $classroom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassExamPerformanceModelImpl &&
            (identical(other.avg_score, avg_score) ||
                other.avg_score == avg_score) &&
            const DeepCollectionEquality()
                .equals(other._grade_scores, _grade_scores) &&
            const DeepCollectionEquality()
                .equals(other._bloom_skill_scores, _bloom_skill_scores) &&
            const DeepCollectionEquality()
                .equals(other._strand_scores, _strand_scores) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.classroom, classroom) ||
                other.classroom == classroom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      avg_score,
      const DeepCollectionEquality().hash(_grade_scores),
      const DeepCollectionEquality().hash(_bloom_skill_scores),
      const DeepCollectionEquality().hash(_strand_scores),
      exam,
      created_at,
      updated_at,
      classroom);

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
      {final double? avg_score,
      final List<ScoreModel>? grade_scores,
      final List<ScoreModel>? bloom_skill_scores,
      final List<ScoreModel>? strand_scores,
      final ExamModel? exam,
      final DateTime? created_at,
      final DateTime? updated_at,
      final ClassroomModel? classroom}) = _$ClassExamPerformanceModelImpl;

  factory _ClassExamPerformanceModel.fromJson(Map<String, dynamic> json) =
      _$ClassExamPerformanceModelImpl.fromJson;

  @override
  double? get avg_score;
  @override
  List<ScoreModel>? get grade_scores;
  @override
  List<ScoreModel>? get bloom_skill_scores;
  @override
  List<ScoreModel>? get strand_scores;
  @override
  ExamModel? get exam;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;
  @override
  ClassroomModel? get classroom;

  /// Create a copy of ClassExamPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassExamPerformanceModelImplCopyWith<_$ClassExamPerformanceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentExamSessionModel _$StudentExamSessionModelFromJson(
    Map<String, dynamic> json) {
  return _StudentExamSessionModel.fromJson(json);
}

/// @nodoc
mixin _$StudentExamSessionModel {
  int? get student_id => throw _privateConstructorUsedError;
  ExamModel? get exam => throw _privateConstructorUsedError;
  DateTime? get start_date_time => throw _privateConstructorUsedError;
  DateTime? get end_date_time => throw _privateConstructorUsedError;
  int? get duration_min => throw _privateConstructorUsedError;
  double? get avg_score => throw _privateConstructorUsedError;
  String? get expectation_level => throw _privateConstructorUsedError;

  /// Serializes this StudentExamSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentExamSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentExamSessionModelCopyWith<StudentExamSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentExamSessionModelCopyWith<$Res> {
  factory $StudentExamSessionModelCopyWith(StudentExamSessionModel value,
          $Res Function(StudentExamSessionModel) then) =
      _$StudentExamSessionModelCopyWithImpl<$Res, StudentExamSessionModel>;
  @useResult
  $Res call(
      {int? student_id,
      ExamModel? exam,
      DateTime? start_date_time,
      DateTime? end_date_time,
      int? duration_min,
      double? avg_score,
      String? expectation_level});

  $ExamModelCopyWith<$Res>? get exam;
}

/// @nodoc
class _$StudentExamSessionModelCopyWithImpl<$Res,
        $Val extends StudentExamSessionModel>
    implements $StudentExamSessionModelCopyWith<$Res> {
  _$StudentExamSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentExamSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? student_id = freezed,
    Object? exam = freezed,
    Object? start_date_time = freezed,
    Object? end_date_time = freezed,
    Object? duration_min = freezed,
    Object? avg_score = freezed,
    Object? expectation_level = freezed,
  }) {
    return _then(_value.copyWith(
      student_id: freezed == student_id
          ? _value.student_id
          : student_id // ignore: cast_nullable_to_non_nullable
              as int?,
      exam: freezed == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamModel?,
      start_date_time: freezed == start_date_time
          ? _value.start_date_time
          : start_date_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end_date_time: freezed == end_date_time
          ? _value.end_date_time
          : end_date_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration_min: freezed == duration_min
          ? _value.duration_min
          : duration_min // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      expectation_level: freezed == expectation_level
          ? _value.expectation_level
          : expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of StudentExamSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExamModelCopyWith<$Res>? get exam {
    if (_value.exam == null) {
      return null;
    }

    return $ExamModelCopyWith<$Res>(_value.exam!, (value) {
      return _then(_value.copyWith(exam: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentExamSessionModelImplCopyWith<$Res>
    implements $StudentExamSessionModelCopyWith<$Res> {
  factory _$$StudentExamSessionModelImplCopyWith(
          _$StudentExamSessionModelImpl value,
          $Res Function(_$StudentExamSessionModelImpl) then) =
      __$$StudentExamSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? student_id,
      ExamModel? exam,
      DateTime? start_date_time,
      DateTime? end_date_time,
      int? duration_min,
      double? avg_score,
      String? expectation_level});

  @override
  $ExamModelCopyWith<$Res>? get exam;
}

/// @nodoc
class __$$StudentExamSessionModelImplCopyWithImpl<$Res>
    extends _$StudentExamSessionModelCopyWithImpl<$Res,
        _$StudentExamSessionModelImpl>
    implements _$$StudentExamSessionModelImplCopyWith<$Res> {
  __$$StudentExamSessionModelImplCopyWithImpl(
      _$StudentExamSessionModelImpl _value,
      $Res Function(_$StudentExamSessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentExamSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? student_id = freezed,
    Object? exam = freezed,
    Object? start_date_time = freezed,
    Object? end_date_time = freezed,
    Object? duration_min = freezed,
    Object? avg_score = freezed,
    Object? expectation_level = freezed,
  }) {
    return _then(_$StudentExamSessionModelImpl(
      student_id: freezed == student_id
          ? _value.student_id
          : student_id // ignore: cast_nullable_to_non_nullable
              as int?,
      exam: freezed == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamModel?,
      start_date_time: freezed == start_date_time
          ? _value.start_date_time
          : start_date_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end_date_time: freezed == end_date_time
          ? _value.end_date_time
          : end_date_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration_min: freezed == duration_min
          ? _value.duration_min
          : duration_min // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      expectation_level: freezed == expectation_level
          ? _value.expectation_level
          : expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentExamSessionModelImpl implements _StudentExamSessionModel {
  _$StudentExamSessionModelImpl(
      {this.student_id,
      this.exam,
      this.start_date_time,
      this.end_date_time,
      this.duration_min,
      this.avg_score,
      this.expectation_level});

  factory _$StudentExamSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentExamSessionModelImplFromJson(json);

  @override
  final int? student_id;
  @override
  final ExamModel? exam;
  @override
  final DateTime? start_date_time;
  @override
  final DateTime? end_date_time;
  @override
  final int? duration_min;
  @override
  final double? avg_score;
  @override
  final String? expectation_level;

  @override
  String toString() {
    return 'StudentExamSessionModel(student_id: $student_id, exam: $exam, start_date_time: $start_date_time, end_date_time: $end_date_time, duration_min: $duration_min, avg_score: $avg_score, expectation_level: $expectation_level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentExamSessionModelImpl &&
            (identical(other.student_id, student_id) ||
                other.student_id == student_id) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.start_date_time, start_date_time) ||
                other.start_date_time == start_date_time) &&
            (identical(other.end_date_time, end_date_time) ||
                other.end_date_time == end_date_time) &&
            (identical(other.duration_min, duration_min) ||
                other.duration_min == duration_min) &&
            (identical(other.avg_score, avg_score) ||
                other.avg_score == avg_score) &&
            (identical(other.expectation_level, expectation_level) ||
                other.expectation_level == expectation_level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      student_id,
      exam,
      start_date_time,
      end_date_time,
      duration_min,
      avg_score,
      expectation_level);

  /// Create a copy of StudentExamSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentExamSessionModelImplCopyWith<_$StudentExamSessionModelImpl>
      get copyWith => __$$StudentExamSessionModelImplCopyWithImpl<
          _$StudentExamSessionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentExamSessionModelImplToJson(
      this,
    );
  }
}

abstract class _StudentExamSessionModel implements StudentExamSessionModel {
  factory _StudentExamSessionModel(
      {final int? student_id,
      final ExamModel? exam,
      final DateTime? start_date_time,
      final DateTime? end_date_time,
      final int? duration_min,
      final double? avg_score,
      final String? expectation_level}) = _$StudentExamSessionModelImpl;

  factory _StudentExamSessionModel.fromJson(Map<String, dynamic> json) =
      _$StudentExamSessionModelImpl.fromJson;

  @override
  int? get student_id;
  @override
  ExamModel? get exam;
  @override
  DateTime? get start_date_time;
  @override
  DateTime? get end_date_time;
  @override
  int? get duration_min;
  @override
  double? get avg_score;
  @override
  String? get expectation_level;

  /// Create a copy of StudentExamSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentExamSessionModelImplCopyWith<_$StudentExamSessionModelImpl>
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
