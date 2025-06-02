// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExamModel _$ExamModelFromJson(Map<String, dynamic> json) {
  return _ExamModel.fromJson(json);
}

/// @nodoc
mixin _$ExamModel {
  int? get id => throw _privateConstructorUsedError;
  DateTime? get start_date_time => throw _privateConstructorUsedError;
  DateTime? get end_date_time => throw _privateConstructorUsedError;
  ExamStatus? get status => throw _privateConstructorUsedError;
  bool? get is_published => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  int? get duration_min => throw _privateConstructorUsedError;
  String? get generation_error => throw _privateConstructorUsedError;
  int? get classroom_id => throw _privateConstructorUsedError;
  String? get classroom_name => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;
  ExamQuestionAnalysisModel? get analysis => throw _privateConstructorUsedError;
  int? get student_id => throw _privateConstructorUsedError;

  /// Serializes this ExamModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamModelCopyWith<ExamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamModelCopyWith<$Res> {
  factory $ExamModelCopyWith(ExamModel value, $Res Function(ExamModel) then) =
      _$ExamModelCopyWithImpl<$Res, ExamModel>;
  @useResult
  $Res call(
      {int? id,
      DateTime? start_date_time,
      DateTime? end_date_time,
      ExamStatus? status,
      bool? is_published,
      String? code,
      int? duration_min,
      String? generation_error,
      int? classroom_id,
      String? classroom_name,
      DateTime? created_at,
      DateTime? updated_at,
      ExamQuestionAnalysisModel? analysis,
      int? student_id});

  $ExamQuestionAnalysisModelCopyWith<$Res>? get analysis;
}

/// @nodoc
class _$ExamModelCopyWithImpl<$Res, $Val extends ExamModel>
    implements $ExamModelCopyWith<$Res> {
  _$ExamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? start_date_time = freezed,
    Object? end_date_time = freezed,
    Object? status = freezed,
    Object? is_published = freezed,
    Object? code = freezed,
    Object? duration_min = freezed,
    Object? generation_error = freezed,
    Object? classroom_id = freezed,
    Object? classroom_name = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? analysis = freezed,
    Object? student_id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      start_date_time: freezed == start_date_time
          ? _value.start_date_time
          : start_date_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end_date_time: freezed == end_date_time
          ? _value.end_date_time
          : end_date_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ExamStatus?,
      is_published: freezed == is_published
          ? _value.is_published
          : is_published // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      duration_min: freezed == duration_min
          ? _value.duration_min
          : duration_min // ignore: cast_nullable_to_non_nullable
              as int?,
      generation_error: freezed == generation_error
          ? _value.generation_error
          : generation_error // ignore: cast_nullable_to_non_nullable
              as String?,
      classroom_id: freezed == classroom_id
          ? _value.classroom_id
          : classroom_id // ignore: cast_nullable_to_non_nullable
              as int?,
      classroom_name: freezed == classroom_name
          ? _value.classroom_name
          : classroom_name // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      analysis: freezed == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as ExamQuestionAnalysisModel?,
      student_id: freezed == student_id
          ? _value.student_id
          : student_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExamQuestionAnalysisModelCopyWith<$Res>? get analysis {
    if (_value.analysis == null) {
      return null;
    }

    return $ExamQuestionAnalysisModelCopyWith<$Res>(_value.analysis!, (value) {
      return _then(_value.copyWith(analysis: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExamModelImplCopyWith<$Res>
    implements $ExamModelCopyWith<$Res> {
  factory _$$ExamModelImplCopyWith(
          _$ExamModelImpl value, $Res Function(_$ExamModelImpl) then) =
      __$$ExamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DateTime? start_date_time,
      DateTime? end_date_time,
      ExamStatus? status,
      bool? is_published,
      String? code,
      int? duration_min,
      String? generation_error,
      int? classroom_id,
      String? classroom_name,
      DateTime? created_at,
      DateTime? updated_at,
      ExamQuestionAnalysisModel? analysis,
      int? student_id});

  @override
  $ExamQuestionAnalysisModelCopyWith<$Res>? get analysis;
}

/// @nodoc
class __$$ExamModelImplCopyWithImpl<$Res>
    extends _$ExamModelCopyWithImpl<$Res, _$ExamModelImpl>
    implements _$$ExamModelImplCopyWith<$Res> {
  __$$ExamModelImplCopyWithImpl(
      _$ExamModelImpl _value, $Res Function(_$ExamModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? start_date_time = freezed,
    Object? end_date_time = freezed,
    Object? status = freezed,
    Object? is_published = freezed,
    Object? code = freezed,
    Object? duration_min = freezed,
    Object? generation_error = freezed,
    Object? classroom_id = freezed,
    Object? classroom_name = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? analysis = freezed,
    Object? student_id = freezed,
  }) {
    return _then(_$ExamModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      start_date_time: freezed == start_date_time
          ? _value.start_date_time
          : start_date_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end_date_time: freezed == end_date_time
          ? _value.end_date_time
          : end_date_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ExamStatus?,
      is_published: freezed == is_published
          ? _value.is_published
          : is_published // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      duration_min: freezed == duration_min
          ? _value.duration_min
          : duration_min // ignore: cast_nullable_to_non_nullable
              as int?,
      generation_error: freezed == generation_error
          ? _value.generation_error
          : generation_error // ignore: cast_nullable_to_non_nullable
              as String?,
      classroom_id: freezed == classroom_id
          ? _value.classroom_id
          : classroom_id // ignore: cast_nullable_to_non_nullable
              as int?,
      classroom_name: freezed == classroom_name
          ? _value.classroom_name
          : classroom_name // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      analysis: freezed == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as ExamQuestionAnalysisModel?,
      student_id: freezed == student_id
          ? _value.student_id
          : student_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamModelImpl implements _ExamModel {
  _$ExamModelImpl(
      {this.id,
      this.start_date_time,
      this.end_date_time,
      this.status,
      this.is_published,
      this.code,
      this.duration_min,
      this.generation_error,
      this.classroom_id,
      this.classroom_name,
      this.created_at,
      this.updated_at,
      this.analysis,
      this.student_id});

  factory _$ExamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamModelImplFromJson(json);

  @override
  final int? id;
  @override
  final DateTime? start_date_time;
  @override
  final DateTime? end_date_time;
  @override
  final ExamStatus? status;
  @override
  final bool? is_published;
  @override
  final String? code;
  @override
  final int? duration_min;
  @override
  final String? generation_error;
  @override
  final int? classroom_id;
  @override
  final String? classroom_name;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;
  @override
  final ExamQuestionAnalysisModel? analysis;
  @override
  final int? student_id;

  @override
  String toString() {
    return 'ExamModel(id: $id, start_date_time: $start_date_time, end_date_time: $end_date_time, status: $status, is_published: $is_published, code: $code, duration_min: $duration_min, generation_error: $generation_error, classroom_id: $classroom_id, classroom_name: $classroom_name, created_at: $created_at, updated_at: $updated_at, analysis: $analysis, student_id: $student_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start_date_time, start_date_time) ||
                other.start_date_time == start_date_time) &&
            (identical(other.end_date_time, end_date_time) ||
                other.end_date_time == end_date_time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.is_published, is_published) ||
                other.is_published == is_published) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.duration_min, duration_min) ||
                other.duration_min == duration_min) &&
            (identical(other.generation_error, generation_error) ||
                other.generation_error == generation_error) &&
            (identical(other.classroom_id, classroom_id) ||
                other.classroom_id == classroom_id) &&
            (identical(other.classroom_name, classroom_name) ||
                other.classroom_name == classroom_name) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.analysis, analysis) ||
                other.analysis == analysis) &&
            (identical(other.student_id, student_id) ||
                other.student_id == student_id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      start_date_time,
      end_date_time,
      status,
      is_published,
      code,
      duration_min,
      generation_error,
      classroom_id,
      classroom_name,
      created_at,
      updated_at,
      analysis,
      student_id);

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamModelImplCopyWith<_$ExamModelImpl> get copyWith =>
      __$$ExamModelImplCopyWithImpl<_$ExamModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamModelImplToJson(
      this,
    );
  }
}

abstract class _ExamModel implements ExamModel {
  factory _ExamModel(
      {final int? id,
      final DateTime? start_date_time,
      final DateTime? end_date_time,
      final ExamStatus? status,
      final bool? is_published,
      final String? code,
      final int? duration_min,
      final String? generation_error,
      final int? classroom_id,
      final String? classroom_name,
      final DateTime? created_at,
      final DateTime? updated_at,
      final ExamQuestionAnalysisModel? analysis,
      final int? student_id}) = _$ExamModelImpl;

  factory _ExamModel.fromJson(Map<String, dynamic> json) =
      _$ExamModelImpl.fromJson;

  @override
  int? get id;
  @override
  DateTime? get start_date_time;
  @override
  DateTime? get end_date_time;
  @override
  ExamStatus? get status;
  @override
  bool? get is_published;
  @override
  String? get code;
  @override
  int? get duration_min;
  @override
  String? get generation_error;
  @override
  int? get classroom_id;
  @override
  String? get classroom_name;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;
  @override
  ExamQuestionAnalysisModel? get analysis;
  @override
  int? get student_id;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamModelImplCopyWith<_$ExamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExamQuestionAnalysisModel _$ExamQuestionAnalysisModelFromJson(
    Map<String, dynamic> json) {
  return _ExamQuestionAnalysisModel.fromJson(json);
}

/// @nodoc
mixin _$ExamQuestionAnalysisModel {
  int? get question_count => throw _privateConstructorUsedError;
  List<ScoreModel>? get grade_distribution =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get bloom_skill_distribution =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get strand_distribution =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get sub_strand_distribution =>
      throw _privateConstructorUsedError;

  /// Serializes this ExamQuestionAnalysisModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamQuestionAnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamQuestionAnalysisModelCopyWith<ExamQuestionAnalysisModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamQuestionAnalysisModelCopyWith<$Res> {
  factory $ExamQuestionAnalysisModelCopyWith(ExamQuestionAnalysisModel value,
          $Res Function(ExamQuestionAnalysisModel) then) =
      _$ExamQuestionAnalysisModelCopyWithImpl<$Res, ExamQuestionAnalysisModel>;
  @useResult
  $Res call(
      {int? question_count,
      List<ScoreModel>? grade_distribution,
      List<ScoreModel>? bloom_skill_distribution,
      List<ScoreModel>? strand_distribution,
      List<ScoreModel>? sub_strand_distribution});
}

/// @nodoc
class _$ExamQuestionAnalysisModelCopyWithImpl<$Res,
        $Val extends ExamQuestionAnalysisModel>
    implements $ExamQuestionAnalysisModelCopyWith<$Res> {
  _$ExamQuestionAnalysisModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamQuestionAnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question_count = freezed,
    Object? grade_distribution = freezed,
    Object? bloom_skill_distribution = freezed,
    Object? strand_distribution = freezed,
    Object? sub_strand_distribution = freezed,
  }) {
    return _then(_value.copyWith(
      question_count: freezed == question_count
          ? _value.question_count
          : question_count // ignore: cast_nullable_to_non_nullable
              as int?,
      grade_distribution: freezed == grade_distribution
          ? _value.grade_distribution
          : grade_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      bloom_skill_distribution: freezed == bloom_skill_distribution
          ? _value.bloom_skill_distribution
          : bloom_skill_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      strand_distribution: freezed == strand_distribution
          ? _value.strand_distribution
          : strand_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      sub_strand_distribution: freezed == sub_strand_distribution
          ? _value.sub_strand_distribution
          : sub_strand_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamQuestionAnalysisModelImplCopyWith<$Res>
    implements $ExamQuestionAnalysisModelCopyWith<$Res> {
  factory _$$ExamQuestionAnalysisModelImplCopyWith(
          _$ExamQuestionAnalysisModelImpl value,
          $Res Function(_$ExamQuestionAnalysisModelImpl) then) =
      __$$ExamQuestionAnalysisModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? question_count,
      List<ScoreModel>? grade_distribution,
      List<ScoreModel>? bloom_skill_distribution,
      List<ScoreModel>? strand_distribution,
      List<ScoreModel>? sub_strand_distribution});
}

/// @nodoc
class __$$ExamQuestionAnalysisModelImplCopyWithImpl<$Res>
    extends _$ExamQuestionAnalysisModelCopyWithImpl<$Res,
        _$ExamQuestionAnalysisModelImpl>
    implements _$$ExamQuestionAnalysisModelImplCopyWith<$Res> {
  __$$ExamQuestionAnalysisModelImplCopyWithImpl(
      _$ExamQuestionAnalysisModelImpl _value,
      $Res Function(_$ExamQuestionAnalysisModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamQuestionAnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question_count = freezed,
    Object? grade_distribution = freezed,
    Object? bloom_skill_distribution = freezed,
    Object? strand_distribution = freezed,
    Object? sub_strand_distribution = freezed,
  }) {
    return _then(_$ExamQuestionAnalysisModelImpl(
      question_count: freezed == question_count
          ? _value.question_count
          : question_count // ignore: cast_nullable_to_non_nullable
              as int?,
      grade_distribution: freezed == grade_distribution
          ? _value._grade_distribution
          : grade_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      bloom_skill_distribution: freezed == bloom_skill_distribution
          ? _value._bloom_skill_distribution
          : bloom_skill_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      strand_distribution: freezed == strand_distribution
          ? _value._strand_distribution
          : strand_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
      sub_strand_distribution: freezed == sub_strand_distribution
          ? _value._sub_strand_distribution
          : sub_strand_distribution // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamQuestionAnalysisModelImpl implements _ExamQuestionAnalysisModel {
  _$ExamQuestionAnalysisModelImpl(
      {this.question_count,
      final List<ScoreModel>? grade_distribution,
      final List<ScoreModel>? bloom_skill_distribution,
      final List<ScoreModel>? strand_distribution,
      final List<ScoreModel>? sub_strand_distribution})
      : _grade_distribution = grade_distribution,
        _bloom_skill_distribution = bloom_skill_distribution,
        _strand_distribution = strand_distribution,
        _sub_strand_distribution = sub_strand_distribution;

  factory _$ExamQuestionAnalysisModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamQuestionAnalysisModelImplFromJson(json);

  @override
  final int? question_count;
  final List<ScoreModel>? _grade_distribution;
  @override
  List<ScoreModel>? get grade_distribution {
    final value = _grade_distribution;
    if (value == null) return null;
    if (_grade_distribution is EqualUnmodifiableListView)
      return _grade_distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _bloom_skill_distribution;
  @override
  List<ScoreModel>? get bloom_skill_distribution {
    final value = _bloom_skill_distribution;
    if (value == null) return null;
    if (_bloom_skill_distribution is EqualUnmodifiableListView)
      return _bloom_skill_distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _strand_distribution;
  @override
  List<ScoreModel>? get strand_distribution {
    final value = _strand_distribution;
    if (value == null) return null;
    if (_strand_distribution is EqualUnmodifiableListView)
      return _strand_distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ScoreModel>? _sub_strand_distribution;
  @override
  List<ScoreModel>? get sub_strand_distribution {
    final value = _sub_strand_distribution;
    if (value == null) return null;
    if (_sub_strand_distribution is EqualUnmodifiableListView)
      return _sub_strand_distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExamQuestionAnalysisModel(question_count: $question_count, grade_distribution: $grade_distribution, bloom_skill_distribution: $bloom_skill_distribution, strand_distribution: $strand_distribution, sub_strand_distribution: $sub_strand_distribution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamQuestionAnalysisModelImpl &&
            (identical(other.question_count, question_count) ||
                other.question_count == question_count) &&
            const DeepCollectionEquality()
                .equals(other._grade_distribution, _grade_distribution) &&
            const DeepCollectionEquality().equals(
                other._bloom_skill_distribution, _bloom_skill_distribution) &&
            const DeepCollectionEquality()
                .equals(other._strand_distribution, _strand_distribution) &&
            const DeepCollectionEquality().equals(
                other._sub_strand_distribution, _sub_strand_distribution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      question_count,
      const DeepCollectionEquality().hash(_grade_distribution),
      const DeepCollectionEquality().hash(_bloom_skill_distribution),
      const DeepCollectionEquality().hash(_strand_distribution),
      const DeepCollectionEquality().hash(_sub_strand_distribution));

  /// Create a copy of ExamQuestionAnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamQuestionAnalysisModelImplCopyWith<_$ExamQuestionAnalysisModelImpl>
      get copyWith => __$$ExamQuestionAnalysisModelImplCopyWithImpl<
          _$ExamQuestionAnalysisModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamQuestionAnalysisModelImplToJson(
      this,
    );
  }
}

abstract class _ExamQuestionAnalysisModel implements ExamQuestionAnalysisModel {
  factory _ExamQuestionAnalysisModel(
          {final int? question_count,
          final List<ScoreModel>? grade_distribution,
          final List<ScoreModel>? bloom_skill_distribution,
          final List<ScoreModel>? strand_distribution,
          final List<ScoreModel>? sub_strand_distribution}) =
      _$ExamQuestionAnalysisModelImpl;

  factory _ExamQuestionAnalysisModel.fromJson(Map<String, dynamic> json) =
      _$ExamQuestionAnalysisModelImpl.fromJson;

  @override
  int? get question_count;
  @override
  List<ScoreModel>? get grade_distribution;
  @override
  List<ScoreModel>? get bloom_skill_distribution;
  @override
  List<ScoreModel>? get strand_distribution;
  @override
  List<ScoreModel>? get sub_strand_distribution;

  /// Create a copy of ExamQuestionAnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamQuestionAnalysisModelImplCopyWith<_$ExamQuestionAnalysisModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ScoreModel _$ScoreModelFromJson(Map<String, dynamic> json) {
  return _ScoreModel.fromJson(json);
}

/// @nodoc
mixin _$ScoreModel {
  int? get id => throw _privateConstructorUsedError;
  dynamic get name => throw _privateConstructorUsedError; // String or int
  int? get count => throw _privateConstructorUsedError;
  double? get percentage => throw _privateConstructorUsedError;
  String? get expectation_level => throw _privateConstructorUsedError;

  /// Serializes this ScoreModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoreModelCopyWith<ScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreModelCopyWith<$Res> {
  factory $ScoreModelCopyWith(
          ScoreModel value, $Res Function(ScoreModel) then) =
      _$ScoreModelCopyWithImpl<$Res, ScoreModel>;
  @useResult
  $Res call(
      {int? id,
      dynamic name,
      int? count,
      double? percentage,
      String? expectation_level});
}

/// @nodoc
class _$ScoreModelCopyWithImpl<$Res, $Val extends ScoreModel>
    implements $ScoreModelCopyWith<$Res> {
  _$ScoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? count = freezed,
    Object? percentage = freezed,
    Object? expectation_level = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      expectation_level: freezed == expectation_level
          ? _value.expectation_level
          : expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreModelImplCopyWith<$Res>
    implements $ScoreModelCopyWith<$Res> {
  factory _$$ScoreModelImplCopyWith(
          _$ScoreModelImpl value, $Res Function(_$ScoreModelImpl) then) =
      __$$ScoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      dynamic name,
      int? count,
      double? percentage,
      String? expectation_level});
}

/// @nodoc
class __$$ScoreModelImplCopyWithImpl<$Res>
    extends _$ScoreModelCopyWithImpl<$Res, _$ScoreModelImpl>
    implements _$$ScoreModelImplCopyWith<$Res> {
  __$$ScoreModelImplCopyWithImpl(
      _$ScoreModelImpl _value, $Res Function(_$ScoreModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? count = freezed,
    Object? percentage = freezed,
    Object? expectation_level = freezed,
  }) {
    return _then(_$ScoreModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
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
class _$ScoreModelImpl implements _ScoreModel {
  _$ScoreModelImpl(
      {this.id,
      this.name,
      this.count,
      this.percentage,
      this.expectation_level});

  factory _$ScoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreModelImplFromJson(json);

  @override
  final int? id;
  @override
  final dynamic name;
// String or int
  @override
  final int? count;
  @override
  final double? percentage;
  @override
  final String? expectation_level;

  @override
  String toString() {
    return 'ScoreModel(id: $id, name: $name, count: $count, percentage: $percentage, expectation_level: $expectation_level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.expectation_level, expectation_level) ||
                other.expectation_level == expectation_level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(name),
      count,
      percentage,
      expectation_level);

  /// Create a copy of ScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreModelImplCopyWith<_$ScoreModelImpl> get copyWith =>
      __$$ScoreModelImplCopyWithImpl<_$ScoreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreModelImplToJson(
      this,
    );
  }
}

abstract class _ScoreModel implements ScoreModel {
  factory _ScoreModel(
      {final int? id,
      final dynamic name,
      final int? count,
      final double? percentage,
      final String? expectation_level}) = _$ScoreModelImpl;

  factory _ScoreModel.fromJson(Map<String, dynamic> json) =
      _$ScoreModelImpl.fromJson;

  @override
  int? get id;
  @override
  dynamic get name; // String or int
  @override
  int? get count;
  @override
  double? get percentage;
  @override
  String? get expectation_level;

  /// Create a copy of ScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoreModelImplCopyWith<_$ScoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExamQuestionModel _$ExamQuestionModelFromJson(Map<String, dynamic> json) {
  return _ExamQuestionModel.fromJson(json);
}

/// @nodoc
mixin _$ExamQuestionModel {
  int? get id => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  int? get grade => throw _privateConstructorUsedError;
  String? get strand => throw _privateConstructorUsedError;
  String? get sub_strand => throw _privateConstructorUsedError;
  String? get bloom_skill => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get expected_answer => throw _privateConstructorUsedError;
  List<String>? get bloom_skill_options => throw _privateConstructorUsedError;
  List<String>? get question_options => throw _privateConstructorUsedError;
  List<String>? get answer_options => throw _privateConstructorUsedError;
  String? get tr_description => throw _privateConstructorUsedError;
  String? get tr_expected_answer => throw _privateConstructorUsedError;

  /// Serializes this ExamQuestionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamQuestionModelCopyWith<ExamQuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamQuestionModelCopyWith<$Res> {
  factory $ExamQuestionModelCopyWith(
          ExamQuestionModel value, $Res Function(ExamQuestionModel) then) =
      _$ExamQuestionModelCopyWithImpl<$Res, ExamQuestionModel>;
  @useResult
  $Res call(
      {int? id,
      int? number,
      int? grade,
      String? strand,
      String? sub_strand,
      String? bloom_skill,
      String? description,
      String? expected_answer,
      List<String>? bloom_skill_options,
      List<String>? question_options,
      List<String>? answer_options,
      String? tr_description,
      String? tr_expected_answer});
}

/// @nodoc
class _$ExamQuestionModelCopyWithImpl<$Res, $Val extends ExamQuestionModel>
    implements $ExamQuestionModelCopyWith<$Res> {
  _$ExamQuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? grade = freezed,
    Object? strand = freezed,
    Object? sub_strand = freezed,
    Object? bloom_skill = freezed,
    Object? description = freezed,
    Object? expected_answer = freezed,
    Object? bloom_skill_options = freezed,
    Object? question_options = freezed,
    Object? answer_options = freezed,
    Object? tr_description = freezed,
    Object? tr_expected_answer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      strand: freezed == strand
          ? _value.strand
          : strand // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_strand: freezed == sub_strand
          ? _value.sub_strand
          : sub_strand // ignore: cast_nullable_to_non_nullable
              as String?,
      bloom_skill: freezed == bloom_skill
          ? _value.bloom_skill
          : bloom_skill // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      expected_answer: freezed == expected_answer
          ? _value.expected_answer
          : expected_answer // ignore: cast_nullable_to_non_nullable
              as String?,
      bloom_skill_options: freezed == bloom_skill_options
          ? _value.bloom_skill_options
          : bloom_skill_options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      question_options: freezed == question_options
          ? _value.question_options
          : question_options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      answer_options: freezed == answer_options
          ? _value.answer_options
          : answer_options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tr_description: freezed == tr_description
          ? _value.tr_description
          : tr_description // ignore: cast_nullable_to_non_nullable
              as String?,
      tr_expected_answer: freezed == tr_expected_answer
          ? _value.tr_expected_answer
          : tr_expected_answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamQuestionModelImplCopyWith<$Res>
    implements $ExamQuestionModelCopyWith<$Res> {
  factory _$$ExamQuestionModelImplCopyWith(_$ExamQuestionModelImpl value,
          $Res Function(_$ExamQuestionModelImpl) then) =
      __$$ExamQuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? number,
      int? grade,
      String? strand,
      String? sub_strand,
      String? bloom_skill,
      String? description,
      String? expected_answer,
      List<String>? bloom_skill_options,
      List<String>? question_options,
      List<String>? answer_options,
      String? tr_description,
      String? tr_expected_answer});
}

/// @nodoc
class __$$ExamQuestionModelImplCopyWithImpl<$Res>
    extends _$ExamQuestionModelCopyWithImpl<$Res, _$ExamQuestionModelImpl>
    implements _$$ExamQuestionModelImplCopyWith<$Res> {
  __$$ExamQuestionModelImplCopyWithImpl(_$ExamQuestionModelImpl _value,
      $Res Function(_$ExamQuestionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? grade = freezed,
    Object? strand = freezed,
    Object? sub_strand = freezed,
    Object? bloom_skill = freezed,
    Object? description = freezed,
    Object? expected_answer = freezed,
    Object? bloom_skill_options = freezed,
    Object? question_options = freezed,
    Object? answer_options = freezed,
    Object? tr_description = freezed,
    Object? tr_expected_answer = freezed,
  }) {
    return _then(_$ExamQuestionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      strand: freezed == strand
          ? _value.strand
          : strand // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_strand: freezed == sub_strand
          ? _value.sub_strand
          : sub_strand // ignore: cast_nullable_to_non_nullable
              as String?,
      bloom_skill: freezed == bloom_skill
          ? _value.bloom_skill
          : bloom_skill // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      expected_answer: freezed == expected_answer
          ? _value.expected_answer
          : expected_answer // ignore: cast_nullable_to_non_nullable
              as String?,
      bloom_skill_options: freezed == bloom_skill_options
          ? _value._bloom_skill_options
          : bloom_skill_options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      question_options: freezed == question_options
          ? _value._question_options
          : question_options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      answer_options: freezed == answer_options
          ? _value._answer_options
          : answer_options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tr_description: freezed == tr_description
          ? _value.tr_description
          : tr_description // ignore: cast_nullable_to_non_nullable
              as String?,
      tr_expected_answer: freezed == tr_expected_answer
          ? _value.tr_expected_answer
          : tr_expected_answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamQuestionModelImpl implements _ExamQuestionModel {
  _$ExamQuestionModelImpl(
      {this.id,
      this.number,
      this.grade,
      this.strand,
      this.sub_strand,
      this.bloom_skill,
      this.description,
      this.expected_answer,
      final List<String>? bloom_skill_options,
      final List<String>? question_options,
      final List<String>? answer_options,
      this.tr_description,
      this.tr_expected_answer})
      : _bloom_skill_options = bloom_skill_options,
        _question_options = question_options,
        _answer_options = answer_options;

  factory _$ExamQuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamQuestionModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? number;
  @override
  final int? grade;
  @override
  final String? strand;
  @override
  final String? sub_strand;
  @override
  final String? bloom_skill;
  @override
  final String? description;
  @override
  final String? expected_answer;
  final List<String>? _bloom_skill_options;
  @override
  List<String>? get bloom_skill_options {
    final value = _bloom_skill_options;
    if (value == null) return null;
    if (_bloom_skill_options is EqualUnmodifiableListView)
      return _bloom_skill_options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _question_options;
  @override
  List<String>? get question_options {
    final value = _question_options;
    if (value == null) return null;
    if (_question_options is EqualUnmodifiableListView)
      return _question_options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _answer_options;
  @override
  List<String>? get answer_options {
    final value = _answer_options;
    if (value == null) return null;
    if (_answer_options is EqualUnmodifiableListView) return _answer_options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? tr_description;
  @override
  final String? tr_expected_answer;

  @override
  String toString() {
    return 'ExamQuestionModel(id: $id, number: $number, grade: $grade, strand: $strand, sub_strand: $sub_strand, bloom_skill: $bloom_skill, description: $description, expected_answer: $expected_answer, bloom_skill_options: $bloom_skill_options, question_options: $question_options, answer_options: $answer_options, tr_description: $tr_description, tr_expected_answer: $tr_expected_answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamQuestionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.strand, strand) || other.strand == strand) &&
            (identical(other.sub_strand, sub_strand) ||
                other.sub_strand == sub_strand) &&
            (identical(other.bloom_skill, bloom_skill) ||
                other.bloom_skill == bloom_skill) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.expected_answer, expected_answer) ||
                other.expected_answer == expected_answer) &&
            const DeepCollectionEquality()
                .equals(other._bloom_skill_options, _bloom_skill_options) &&
            const DeepCollectionEquality()
                .equals(other._question_options, _question_options) &&
            const DeepCollectionEquality()
                .equals(other._answer_options, _answer_options) &&
            (identical(other.tr_description, tr_description) ||
                other.tr_description == tr_description) &&
            (identical(other.tr_expected_answer, tr_expected_answer) ||
                other.tr_expected_answer == tr_expected_answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      number,
      grade,
      strand,
      sub_strand,
      bloom_skill,
      description,
      expected_answer,
      const DeepCollectionEquality().hash(_bloom_skill_options),
      const DeepCollectionEquality().hash(_question_options),
      const DeepCollectionEquality().hash(_answer_options),
      tr_description,
      tr_expected_answer);

  /// Create a copy of ExamQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamQuestionModelImplCopyWith<_$ExamQuestionModelImpl> get copyWith =>
      __$$ExamQuestionModelImplCopyWithImpl<_$ExamQuestionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamQuestionModelImplToJson(
      this,
    );
  }
}

abstract class _ExamQuestionModel implements ExamQuestionModel {
  factory _ExamQuestionModel(
      {final int? id,
      final int? number,
      final int? grade,
      final String? strand,
      final String? sub_strand,
      final String? bloom_skill,
      final String? description,
      final String? expected_answer,
      final List<String>? bloom_skill_options,
      final List<String>? question_options,
      final List<String>? answer_options,
      final String? tr_description,
      final String? tr_expected_answer}) = _$ExamQuestionModelImpl;

  factory _ExamQuestionModel.fromJson(Map<String, dynamic> json) =
      _$ExamQuestionModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get number;
  @override
  int? get grade;
  @override
  String? get strand;
  @override
  String? get sub_strand;
  @override
  String? get bloom_skill;
  @override
  String? get description;
  @override
  String? get expected_answer;
  @override
  List<String>? get bloom_skill_options;
  @override
  List<String>? get question_options;
  @override
  List<String>? get answer_options;
  @override
  String? get tr_description;
  @override
  String? get tr_expected_answer;

  /// Create a copy of ExamQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamQuestionModelImplCopyWith<_$ExamQuestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentExamSessionModel _$StudentExamSessionModelFromJson(
    Map<String, dynamic> json) {
  return _StudentExamSessionModel.fromJson(json);
}

/// @nodoc
mixin _$StudentExamSessionModel {
  int? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool? get is_late_submission => throw _privateConstructorUsedError;
  DateTime? get start_date_time => throw _privateConstructorUsedError;
  DateTime? get end_date_time => throw _privateConstructorUsedError;
  int? get duration_min => throw _privateConstructorUsedError;
  double? get avg_score => throw _privateConstructorUsedError;
  String? get expectation_level => throw _privateConstructorUsedError;
  int? get exam_id => throw _privateConstructorUsedError;
  int? get student_id => throw _privateConstructorUsedError;
  String? get student_name => throw _privateConstructorUsedError;

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
      {int? id,
      String? status,
      bool? is_late_submission,
      DateTime? start_date_time,
      DateTime? end_date_time,
      int? duration_min,
      double? avg_score,
      String? expectation_level,
      int? exam_id,
      int? student_id,
      String? student_name});
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
    Object? id = freezed,
    Object? status = freezed,
    Object? is_late_submission = freezed,
    Object? start_date_time = freezed,
    Object? end_date_time = freezed,
    Object? duration_min = freezed,
    Object? avg_score = freezed,
    Object? expectation_level = freezed,
    Object? exam_id = freezed,
    Object? student_id = freezed,
    Object? student_name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      is_late_submission: freezed == is_late_submission
          ? _value.is_late_submission
          : is_late_submission // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      exam_id: freezed == exam_id
          ? _value.exam_id
          : exam_id // ignore: cast_nullable_to_non_nullable
              as int?,
      student_id: freezed == student_id
          ? _value.student_id
          : student_id // ignore: cast_nullable_to_non_nullable
              as int?,
      student_name: freezed == student_name
          ? _value.student_name
          : student_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {int? id,
      String? status,
      bool? is_late_submission,
      DateTime? start_date_time,
      DateTime? end_date_time,
      int? duration_min,
      double? avg_score,
      String? expectation_level,
      int? exam_id,
      int? student_id,
      String? student_name});
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
    Object? id = freezed,
    Object? status = freezed,
    Object? is_late_submission = freezed,
    Object? start_date_time = freezed,
    Object? end_date_time = freezed,
    Object? duration_min = freezed,
    Object? avg_score = freezed,
    Object? expectation_level = freezed,
    Object? exam_id = freezed,
    Object? student_id = freezed,
    Object? student_name = freezed,
  }) {
    return _then(_$StudentExamSessionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      is_late_submission: freezed == is_late_submission
          ? _value.is_late_submission
          : is_late_submission // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      exam_id: freezed == exam_id
          ? _value.exam_id
          : exam_id // ignore: cast_nullable_to_non_nullable
              as int?,
      student_id: freezed == student_id
          ? _value.student_id
          : student_id // ignore: cast_nullable_to_non_nullable
              as int?,
      student_name: freezed == student_name
          ? _value.student_name
          : student_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentExamSessionModelImpl implements _StudentExamSessionModel {
  _$StudentExamSessionModelImpl(
      {this.id,
      this.status,
      this.is_late_submission,
      this.start_date_time,
      this.end_date_time,
      this.duration_min,
      this.avg_score,
      this.expectation_level,
      this.exam_id,
      this.student_id,
      this.student_name});

  factory _$StudentExamSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentExamSessionModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? status;
  @override
  final bool? is_late_submission;
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
  final int? exam_id;
  @override
  final int? student_id;
  @override
  final String? student_name;

  @override
  String toString() {
    return 'StudentExamSessionModel(id: $id, status: $status, is_late_submission: $is_late_submission, start_date_time: $start_date_time, end_date_time: $end_date_time, duration_min: $duration_min, avg_score: $avg_score, expectation_level: $expectation_level, exam_id: $exam_id, student_id: $student_id, student_name: $student_name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentExamSessionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.is_late_submission, is_late_submission) ||
                other.is_late_submission == is_late_submission) &&
            (identical(other.start_date_time, start_date_time) ||
                other.start_date_time == start_date_time) &&
            (identical(other.end_date_time, end_date_time) ||
                other.end_date_time == end_date_time) &&
            (identical(other.duration_min, duration_min) ||
                other.duration_min == duration_min) &&
            (identical(other.avg_score, avg_score) ||
                other.avg_score == avg_score) &&
            (identical(other.expectation_level, expectation_level) ||
                other.expectation_level == expectation_level) &&
            (identical(other.exam_id, exam_id) || other.exam_id == exam_id) &&
            (identical(other.student_id, student_id) ||
                other.student_id == student_id) &&
            (identical(other.student_name, student_name) ||
                other.student_name == student_name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      is_late_submission,
      start_date_time,
      end_date_time,
      duration_min,
      avg_score,
      expectation_level,
      exam_id,
      student_id,
      student_name);

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
      {final int? id,
      final String? status,
      final bool? is_late_submission,
      final DateTime? start_date_time,
      final DateTime? end_date_time,
      final int? duration_min,
      final double? avg_score,
      final String? expectation_level,
      final int? exam_id,
      final int? student_id,
      final String? student_name}) = _$StudentExamSessionModelImpl;

  factory _StudentExamSessionModel.fromJson(Map<String, dynamic> json) =
      _$StudentExamSessionModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get status;
  @override
  bool? get is_late_submission;
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
  @override
  int? get exam_id;
  @override
  int? get student_id;
  @override
  String? get student_name;

  /// Create a copy of StudentExamSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentExamSessionModelImplCopyWith<_$StudentExamSessionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentAnswerModel _$StudentAnswerModelFromJson(Map<String, dynamic> json) {
  return _StudentAnswerModel.fromJson(json);
}

/// @nodoc
mixin _$StudentAnswerModel {
  int? get id => throw _privateConstructorUsedError;
  int? get question_id => throw _privateConstructorUsedError;
  int? get question_number => throw _privateConstructorUsedError;
  String? get question_description => throw _privateConstructorUsedError;
  String? get strand => throw _privateConstructorUsedError;
  String? get sub_strand => throw _privateConstructorUsedError;
  String? get bloom_skill => throw _privateConstructorUsedError;
  int? get grade => throw _privateConstructorUsedError;
  String? get expected_answer => throw _privateConstructorUsedError; //
  String? get description => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  String? get expectation_level => throw _privateConstructorUsedError;
  double? get ai_score => throw _privateConstructorUsedError;
  double? get tr_score => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;
  ExamQuestionModel? get question => throw _privateConstructorUsedError;

  /// Serializes this StudentAnswerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentAnswerModelCopyWith<StudentAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentAnswerModelCopyWith<$Res> {
  factory $StudentAnswerModelCopyWith(
          StudentAnswerModel value, $Res Function(StudentAnswerModel) then) =
      _$StudentAnswerModelCopyWithImpl<$Res, StudentAnswerModel>;
  @useResult
  $Res call(
      {int? id,
      int? question_id,
      int? question_number,
      String? question_description,
      String? strand,
      String? sub_strand,
      String? bloom_skill,
      int? grade,
      String? expected_answer,
      String? description,
      double? score,
      String? expectation_level,
      double? ai_score,
      double? tr_score,
      DateTime? created_at,
      DateTime? updated_at,
      ExamQuestionModel? question});

  $ExamQuestionModelCopyWith<$Res>? get question;
}

/// @nodoc
class _$StudentAnswerModelCopyWithImpl<$Res, $Val extends StudentAnswerModel>
    implements $StudentAnswerModelCopyWith<$Res> {
  _$StudentAnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question_id = freezed,
    Object? question_number = freezed,
    Object? question_description = freezed,
    Object? strand = freezed,
    Object? sub_strand = freezed,
    Object? bloom_skill = freezed,
    Object? grade = freezed,
    Object? expected_answer = freezed,
    Object? description = freezed,
    Object? score = freezed,
    Object? expectation_level = freezed,
    Object? ai_score = freezed,
    Object? tr_score = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? question = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question_id: freezed == question_id
          ? _value.question_id
          : question_id // ignore: cast_nullable_to_non_nullable
              as int?,
      question_number: freezed == question_number
          ? _value.question_number
          : question_number // ignore: cast_nullable_to_non_nullable
              as int?,
      question_description: freezed == question_description
          ? _value.question_description
          : question_description // ignore: cast_nullable_to_non_nullable
              as String?,
      strand: freezed == strand
          ? _value.strand
          : strand // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_strand: freezed == sub_strand
          ? _value.sub_strand
          : sub_strand // ignore: cast_nullable_to_non_nullable
              as String?,
      bloom_skill: freezed == bloom_skill
          ? _value.bloom_skill
          : bloom_skill // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      expected_answer: freezed == expected_answer
          ? _value.expected_answer
          : expected_answer // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      expectation_level: freezed == expectation_level
          ? _value.expectation_level
          : expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      ai_score: freezed == ai_score
          ? _value.ai_score
          : ai_score // ignore: cast_nullable_to_non_nullable
              as double?,
      tr_score: freezed == tr_score
          ? _value.tr_score
          : tr_score // ignore: cast_nullable_to_non_nullable
              as double?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as ExamQuestionModel?,
    ) as $Val);
  }

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExamQuestionModelCopyWith<$Res>? get question {
    if (_value.question == null) {
      return null;
    }

    return $ExamQuestionModelCopyWith<$Res>(_value.question!, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentAnswerModelImplCopyWith<$Res>
    implements $StudentAnswerModelCopyWith<$Res> {
  factory _$$StudentAnswerModelImplCopyWith(_$StudentAnswerModelImpl value,
          $Res Function(_$StudentAnswerModelImpl) then) =
      __$$StudentAnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? question_id,
      int? question_number,
      String? question_description,
      String? strand,
      String? sub_strand,
      String? bloom_skill,
      int? grade,
      String? expected_answer,
      String? description,
      double? score,
      String? expectation_level,
      double? ai_score,
      double? tr_score,
      DateTime? created_at,
      DateTime? updated_at,
      ExamQuestionModel? question});

  @override
  $ExamQuestionModelCopyWith<$Res>? get question;
}

/// @nodoc
class __$$StudentAnswerModelImplCopyWithImpl<$Res>
    extends _$StudentAnswerModelCopyWithImpl<$Res, _$StudentAnswerModelImpl>
    implements _$$StudentAnswerModelImplCopyWith<$Res> {
  __$$StudentAnswerModelImplCopyWithImpl(_$StudentAnswerModelImpl _value,
      $Res Function(_$StudentAnswerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question_id = freezed,
    Object? question_number = freezed,
    Object? question_description = freezed,
    Object? strand = freezed,
    Object? sub_strand = freezed,
    Object? bloom_skill = freezed,
    Object? grade = freezed,
    Object? expected_answer = freezed,
    Object? description = freezed,
    Object? score = freezed,
    Object? expectation_level = freezed,
    Object? ai_score = freezed,
    Object? tr_score = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? question = freezed,
  }) {
    return _then(_$StudentAnswerModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question_id: freezed == question_id
          ? _value.question_id
          : question_id // ignore: cast_nullable_to_non_nullable
              as int?,
      question_number: freezed == question_number
          ? _value.question_number
          : question_number // ignore: cast_nullable_to_non_nullable
              as int?,
      question_description: freezed == question_description
          ? _value.question_description
          : question_description // ignore: cast_nullable_to_non_nullable
              as String?,
      strand: freezed == strand
          ? _value.strand
          : strand // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_strand: freezed == sub_strand
          ? _value.sub_strand
          : sub_strand // ignore: cast_nullable_to_non_nullable
              as String?,
      bloom_skill: freezed == bloom_skill
          ? _value.bloom_skill
          : bloom_skill // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      expected_answer: freezed == expected_answer
          ? _value.expected_answer
          : expected_answer // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      expectation_level: freezed == expectation_level
          ? _value.expectation_level
          : expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      ai_score: freezed == ai_score
          ? _value.ai_score
          : ai_score // ignore: cast_nullable_to_non_nullable
              as double?,
      tr_score: freezed == tr_score
          ? _value.tr_score
          : tr_score // ignore: cast_nullable_to_non_nullable
              as double?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as ExamQuestionModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentAnswerModelImpl implements _StudentAnswerModel {
  _$StudentAnswerModelImpl(
      {this.id,
      this.question_id,
      this.question_number,
      this.question_description,
      this.strand,
      this.sub_strand,
      this.bloom_skill,
      this.grade,
      this.expected_answer,
      this.description,
      this.score,
      this.expectation_level,
      this.ai_score,
      this.tr_score,
      this.created_at,
      this.updated_at,
      this.question});

  factory _$StudentAnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentAnswerModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? question_id;
  @override
  final int? question_number;
  @override
  final String? question_description;
  @override
  final String? strand;
  @override
  final String? sub_strand;
  @override
  final String? bloom_skill;
  @override
  final int? grade;
  @override
  final String? expected_answer;
//
  @override
  final String? description;
  @override
  final double? score;
  @override
  final String? expectation_level;
  @override
  final double? ai_score;
  @override
  final double? tr_score;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;
  @override
  final ExamQuestionModel? question;

  @override
  String toString() {
    return 'StudentAnswerModel(id: $id, question_id: $question_id, question_number: $question_number, question_description: $question_description, strand: $strand, sub_strand: $sub_strand, bloom_skill: $bloom_skill, grade: $grade, expected_answer: $expected_answer, description: $description, score: $score, expectation_level: $expectation_level, ai_score: $ai_score, tr_score: $tr_score, created_at: $created_at, updated_at: $updated_at, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentAnswerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question_id, question_id) ||
                other.question_id == question_id) &&
            (identical(other.question_number, question_number) ||
                other.question_number == question_number) &&
            (identical(other.question_description, question_description) ||
                other.question_description == question_description) &&
            (identical(other.strand, strand) || other.strand == strand) &&
            (identical(other.sub_strand, sub_strand) ||
                other.sub_strand == sub_strand) &&
            (identical(other.bloom_skill, bloom_skill) ||
                other.bloom_skill == bloom_skill) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.expected_answer, expected_answer) ||
                other.expected_answer == expected_answer) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.expectation_level, expectation_level) ||
                other.expectation_level == expectation_level) &&
            (identical(other.ai_score, ai_score) ||
                other.ai_score == ai_score) &&
            (identical(other.tr_score, tr_score) ||
                other.tr_score == tr_score) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question_id,
      question_number,
      question_description,
      strand,
      sub_strand,
      bloom_skill,
      grade,
      expected_answer,
      description,
      score,
      expectation_level,
      ai_score,
      tr_score,
      created_at,
      updated_at,
      question);

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentAnswerModelImplCopyWith<_$StudentAnswerModelImpl> get copyWith =>
      __$$StudentAnswerModelImplCopyWithImpl<_$StudentAnswerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentAnswerModelImplToJson(
      this,
    );
  }
}

abstract class _StudentAnswerModel implements StudentAnswerModel {
  factory _StudentAnswerModel(
      {final int? id,
      final int? question_id,
      final int? question_number,
      final String? question_description,
      final String? strand,
      final String? sub_strand,
      final String? bloom_skill,
      final int? grade,
      final String? expected_answer,
      final String? description,
      final double? score,
      final String? expectation_level,
      final double? ai_score,
      final double? tr_score,
      final DateTime? created_at,
      final DateTime? updated_at,
      final ExamQuestionModel? question}) = _$StudentAnswerModelImpl;

  factory _StudentAnswerModel.fromJson(Map<String, dynamic> json) =
      _$StudentAnswerModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get question_id;
  @override
  int? get question_number;
  @override
  String? get question_description;
  @override
  String? get strand;
  @override
  String? get sub_strand;
  @override
  String? get bloom_skill;
  @override
  int? get grade;
  @override
  String? get expected_answer; //
  @override
  String? get description;
  @override
  double? get score;
  @override
  String? get expectation_level;
  @override
  double? get ai_score;
  @override
  double? get tr_score;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;
  @override
  ExamQuestionModel? get question;

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentAnswerModelImplCopyWith<_$StudentAnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentExamSessionDataModel _$StudentExamSessionDataModelFromJson(
    Map<String, dynamic> json) {
  return _StudentExamSessionDataModel.fromJson(json);
}

/// @nodoc
mixin _$StudentExamSessionDataModel {
  StudentExamSessionModel? get session => throw _privateConstructorUsedError;
  List<StudentAnswerModel>? get answers => throw _privateConstructorUsedError;

  /// Serializes this StudentExamSessionDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentExamSessionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentExamSessionDataModelCopyWith<StudentExamSessionDataModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentExamSessionDataModelCopyWith<$Res> {
  factory $StudentExamSessionDataModelCopyWith(
          StudentExamSessionDataModel value,
          $Res Function(StudentExamSessionDataModel) then) =
      _$StudentExamSessionDataModelCopyWithImpl<$Res,
          StudentExamSessionDataModel>;
  @useResult
  $Res call(
      {StudentExamSessionModel? session, List<StudentAnswerModel>? answers});

  $StudentExamSessionModelCopyWith<$Res>? get session;
}

/// @nodoc
class _$StudentExamSessionDataModelCopyWithImpl<$Res,
        $Val extends StudentExamSessionDataModel>
    implements $StudentExamSessionDataModelCopyWith<$Res> {
  _$StudentExamSessionDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentExamSessionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
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

  /// Create a copy of StudentExamSessionDataModel
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
abstract class _$$StudentExamSessionDataModelImplCopyWith<$Res>
    implements $StudentExamSessionDataModelCopyWith<$Res> {
  factory _$$StudentExamSessionDataModelImplCopyWith(
          _$StudentExamSessionDataModelImpl value,
          $Res Function(_$StudentExamSessionDataModelImpl) then) =
      __$$StudentExamSessionDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StudentExamSessionModel? session, List<StudentAnswerModel>? answers});

  @override
  $StudentExamSessionModelCopyWith<$Res>? get session;
}

/// @nodoc
class __$$StudentExamSessionDataModelImplCopyWithImpl<$Res>
    extends _$StudentExamSessionDataModelCopyWithImpl<$Res,
        _$StudentExamSessionDataModelImpl>
    implements _$$StudentExamSessionDataModelImplCopyWith<$Res> {
  __$$StudentExamSessionDataModelImplCopyWithImpl(
      _$StudentExamSessionDataModelImpl _value,
      $Res Function(_$StudentExamSessionDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentExamSessionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? answers = freezed,
  }) {
    return _then(_$StudentExamSessionDataModelImpl(
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
class _$StudentExamSessionDataModelImpl
    implements _StudentExamSessionDataModel {
  _$StudentExamSessionDataModelImpl(
      {this.session, final List<StudentAnswerModel>? answers})
      : _answers = answers;

  factory _$StudentExamSessionDataModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$StudentExamSessionDataModelImplFromJson(json);

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
    return 'StudentExamSessionDataModel(session: $session, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentExamSessionDataModelImpl &&
            (identical(other.session, session) || other.session == session) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, session, const DeepCollectionEquality().hash(_answers));

  /// Create a copy of StudentExamSessionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentExamSessionDataModelImplCopyWith<_$StudentExamSessionDataModelImpl>
      get copyWith => __$$StudentExamSessionDataModelImplCopyWithImpl<
          _$StudentExamSessionDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentExamSessionDataModelImplToJson(
      this,
    );
  }
}

abstract class _StudentExamSessionDataModel
    implements StudentExamSessionDataModel {
  factory _StudentExamSessionDataModel(
          {final StudentExamSessionModel? session,
          final List<StudentAnswerModel>? answers}) =
      _$StudentExamSessionDataModelImpl;

  factory _StudentExamSessionDataModel.fromJson(Map<String, dynamic> json) =
      _$StudentExamSessionDataModelImpl.fromJson;

  @override
  StudentExamSessionModel? get session;
  @override
  List<StudentAnswerModel>? get answers;

  /// Create a copy of StudentExamSessionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentExamSessionDataModelImplCopyWith<_$StudentExamSessionDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
