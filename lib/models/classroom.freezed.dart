// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classroom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassroomModel _$ClassroomModelFromJson(Map<String, dynamic> json) {
  return _ClassroomModel.fromJson(json);
}

/// @nodoc
mixin _$ClassroomModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get school_name => throw _privateConstructorUsedError;
  String? get school_address => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  int? get grade => throw _privateConstructorUsedError;
  int? get teacher_id => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'lesson_times',
      fromJson: _dateTimeListFromJson,
      toJson: _dateTimeListToJson)
  List<DateTime>? get lesson_times => throw _privateConstructorUsedError;
  int? get student_count => throw _privateConstructorUsedError;
  double? get avg_term_score => throw _privateConstructorUsedError;
  String? get avg_term_expectation_level => throw _privateConstructorUsedError;
  double? get avg_mtihani_score => throw _privateConstructorUsedError;
  String? get avg_mtihani_expectation_level =>
      throw _privateConstructorUsedError;
  String? get student_code => throw _privateConstructorUsedError;
  List<TermScore>? get term_scores => throw _privateConstructorUsedError;

  /// Serializes this ClassroomModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassroomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassroomModelCopyWith<ClassroomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassroomModelCopyWith<$Res> {
  factory $ClassroomModelCopyWith(
          ClassroomModel value, $Res Function(ClassroomModel) then) =
      _$ClassroomModelCopyWithImpl<$Res, ClassroomModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? school_name,
      String? school_address,
      String? subject,
      int? grade,
      int? teacher_id,
      @JsonKey(
          name: 'lesson_times',
          fromJson: _dateTimeListFromJson,
          toJson: _dateTimeListToJson)
      List<DateTime>? lesson_times,
      int? student_count,
      double? avg_term_score,
      String? avg_term_expectation_level,
      double? avg_mtihani_score,
      String? avg_mtihani_expectation_level,
      String? student_code,
      List<TermScore>? term_scores});
}

/// @nodoc
class _$ClassroomModelCopyWithImpl<$Res, $Val extends ClassroomModel>
    implements $ClassroomModelCopyWith<$Res> {
  _$ClassroomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassroomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? school_name = freezed,
    Object? school_address = freezed,
    Object? subject = freezed,
    Object? grade = freezed,
    Object? teacher_id = freezed,
    Object? lesson_times = freezed,
    Object? student_count = freezed,
    Object? avg_term_score = freezed,
    Object? avg_term_expectation_level = freezed,
    Object? avg_mtihani_score = freezed,
    Object? avg_mtihani_expectation_level = freezed,
    Object? student_code = freezed,
    Object? term_scores = freezed,
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
      school_name: freezed == school_name
          ? _value.school_name
          : school_name // ignore: cast_nullable_to_non_nullable
              as String?,
      school_address: freezed == school_address
          ? _value.school_address
          : school_address // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      teacher_id: freezed == teacher_id
          ? _value.teacher_id
          : teacher_id // ignore: cast_nullable_to_non_nullable
              as int?,
      lesson_times: freezed == lesson_times
          ? _value.lesson_times
          : lesson_times // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      student_count: freezed == student_count
          ? _value.student_count
          : student_count // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_term_score: freezed == avg_term_score
          ? _value.avg_term_score
          : avg_term_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_term_expectation_level: freezed == avg_term_expectation_level
          ? _value.avg_term_expectation_level
          : avg_term_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_mtihani_score: freezed == avg_mtihani_score
          ? _value.avg_mtihani_score
          : avg_mtihani_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_mtihani_expectation_level: freezed == avg_mtihani_expectation_level
          ? _value.avg_mtihani_expectation_level
          : avg_mtihani_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      student_code: freezed == student_code
          ? _value.student_code
          : student_code // ignore: cast_nullable_to_non_nullable
              as String?,
      term_scores: freezed == term_scores
          ? _value.term_scores
          : term_scores // ignore: cast_nullable_to_non_nullable
              as List<TermScore>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassroomModelImplCopyWith<$Res>
    implements $ClassroomModelCopyWith<$Res> {
  factory _$$ClassroomModelImplCopyWith(_$ClassroomModelImpl value,
          $Res Function(_$ClassroomModelImpl) then) =
      __$$ClassroomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? school_name,
      String? school_address,
      String? subject,
      int? grade,
      int? teacher_id,
      @JsonKey(
          name: 'lesson_times',
          fromJson: _dateTimeListFromJson,
          toJson: _dateTimeListToJson)
      List<DateTime>? lesson_times,
      int? student_count,
      double? avg_term_score,
      String? avg_term_expectation_level,
      double? avg_mtihani_score,
      String? avg_mtihani_expectation_level,
      String? student_code,
      List<TermScore>? term_scores});
}

/// @nodoc
class __$$ClassroomModelImplCopyWithImpl<$Res>
    extends _$ClassroomModelCopyWithImpl<$Res, _$ClassroomModelImpl>
    implements _$$ClassroomModelImplCopyWith<$Res> {
  __$$ClassroomModelImplCopyWithImpl(
      _$ClassroomModelImpl _value, $Res Function(_$ClassroomModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassroomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? school_name = freezed,
    Object? school_address = freezed,
    Object? subject = freezed,
    Object? grade = freezed,
    Object? teacher_id = freezed,
    Object? lesson_times = freezed,
    Object? student_count = freezed,
    Object? avg_term_score = freezed,
    Object? avg_term_expectation_level = freezed,
    Object? avg_mtihani_score = freezed,
    Object? avg_mtihani_expectation_level = freezed,
    Object? student_code = freezed,
    Object? term_scores = freezed,
  }) {
    return _then(_$ClassroomModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      school_name: freezed == school_name
          ? _value.school_name
          : school_name // ignore: cast_nullable_to_non_nullable
              as String?,
      school_address: freezed == school_address
          ? _value.school_address
          : school_address // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      teacher_id: freezed == teacher_id
          ? _value.teacher_id
          : teacher_id // ignore: cast_nullable_to_non_nullable
              as int?,
      lesson_times: freezed == lesson_times
          ? _value._lesson_times
          : lesson_times // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      student_count: freezed == student_count
          ? _value.student_count
          : student_count // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_term_score: freezed == avg_term_score
          ? _value.avg_term_score
          : avg_term_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_term_expectation_level: freezed == avg_term_expectation_level
          ? _value.avg_term_expectation_level
          : avg_term_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_mtihani_score: freezed == avg_mtihani_score
          ? _value.avg_mtihani_score
          : avg_mtihani_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_mtihani_expectation_level: freezed == avg_mtihani_expectation_level
          ? _value.avg_mtihani_expectation_level
          : avg_mtihani_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      student_code: freezed == student_code
          ? _value.student_code
          : student_code // ignore: cast_nullable_to_non_nullable
              as String?,
      term_scores: freezed == term_scores
          ? _value._term_scores
          : term_scores // ignore: cast_nullable_to_non_nullable
              as List<TermScore>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassroomModelImpl implements _ClassroomModel {
  _$ClassroomModelImpl(
      {this.id,
      this.name,
      this.school_name,
      this.school_address,
      this.subject,
      this.grade,
      this.teacher_id,
      @JsonKey(
          name: 'lesson_times',
          fromJson: _dateTimeListFromJson,
          toJson: _dateTimeListToJson)
      final List<DateTime>? lesson_times,
      this.student_count,
      this.avg_term_score,
      this.avg_term_expectation_level,
      this.avg_mtihani_score,
      this.avg_mtihani_expectation_level,
      this.student_code,
      final List<TermScore>? term_scores})
      : _lesson_times = lesson_times,
        _term_scores = term_scores;

  factory _$ClassroomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassroomModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? school_name;
  @override
  final String? school_address;
  @override
  final String? subject;
  @override
  final int? grade;
  @override
  final int? teacher_id;
  final List<DateTime>? _lesson_times;
  @override
  @JsonKey(
      name: 'lesson_times',
      fromJson: _dateTimeListFromJson,
      toJson: _dateTimeListToJson)
  List<DateTime>? get lesson_times {
    final value = _lesson_times;
    if (value == null) return null;
    if (_lesson_times is EqualUnmodifiableListView) return _lesson_times;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? student_count;
  @override
  final double? avg_term_score;
  @override
  final String? avg_term_expectation_level;
  @override
  final double? avg_mtihani_score;
  @override
  final String? avg_mtihani_expectation_level;
  @override
  final String? student_code;
  final List<TermScore>? _term_scores;
  @override
  List<TermScore>? get term_scores {
    final value = _term_scores;
    if (value == null) return null;
    if (_term_scores is EqualUnmodifiableListView) return _term_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClassroomModel(id: $id, name: $name, school_name: $school_name, school_address: $school_address, subject: $subject, grade: $grade, teacher_id: $teacher_id, lesson_times: $lesson_times, student_count: $student_count, avg_term_score: $avg_term_score, avg_term_expectation_level: $avg_term_expectation_level, avg_mtihani_score: $avg_mtihani_score, avg_mtihani_expectation_level: $avg_mtihani_expectation_level, student_code: $student_code, term_scores: $term_scores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassroomModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.school_name, school_name) ||
                other.school_name == school_name) &&
            (identical(other.school_address, school_address) ||
                other.school_address == school_address) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.teacher_id, teacher_id) ||
                other.teacher_id == teacher_id) &&
            const DeepCollectionEquality()
                .equals(other._lesson_times, _lesson_times) &&
            (identical(other.student_count, student_count) ||
                other.student_count == student_count) &&
            (identical(other.avg_term_score, avg_term_score) ||
                other.avg_term_score == avg_term_score) &&
            (identical(other.avg_term_expectation_level,
                    avg_term_expectation_level) ||
                other.avg_term_expectation_level ==
                    avg_term_expectation_level) &&
            (identical(other.avg_mtihani_score, avg_mtihani_score) ||
                other.avg_mtihani_score == avg_mtihani_score) &&
            (identical(other.avg_mtihani_expectation_level,
                    avg_mtihani_expectation_level) ||
                other.avg_mtihani_expectation_level ==
                    avg_mtihani_expectation_level) &&
            (identical(other.student_code, student_code) ||
                other.student_code == student_code) &&
            const DeepCollectionEquality()
                .equals(other._term_scores, _term_scores));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      school_name,
      school_address,
      subject,
      grade,
      teacher_id,
      const DeepCollectionEquality().hash(_lesson_times),
      student_count,
      avg_term_score,
      avg_term_expectation_level,
      avg_mtihani_score,
      avg_mtihani_expectation_level,
      student_code,
      const DeepCollectionEquality().hash(_term_scores));

  /// Create a copy of ClassroomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassroomModelImplCopyWith<_$ClassroomModelImpl> get copyWith =>
      __$$ClassroomModelImplCopyWithImpl<_$ClassroomModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassroomModelImplToJson(
      this,
    );
  }
}

abstract class _ClassroomModel implements ClassroomModel {
  factory _ClassroomModel(
      {final int? id,
      final String? name,
      final String? school_name,
      final String? school_address,
      final String? subject,
      final int? grade,
      final int? teacher_id,
      @JsonKey(
          name: 'lesson_times',
          fromJson: _dateTimeListFromJson,
          toJson: _dateTimeListToJson)
      final List<DateTime>? lesson_times,
      final int? student_count,
      final double? avg_term_score,
      final String? avg_term_expectation_level,
      final double? avg_mtihani_score,
      final String? avg_mtihani_expectation_level,
      final String? student_code,
      final List<TermScore>? term_scores}) = _$ClassroomModelImpl;

  factory _ClassroomModel.fromJson(Map<String, dynamic> json) =
      _$ClassroomModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get school_name;
  @override
  String? get school_address;
  @override
  String? get subject;
  @override
  int? get grade;
  @override
  int? get teacher_id;
  @override
  @JsonKey(
      name: 'lesson_times',
      fromJson: _dateTimeListFromJson,
      toJson: _dateTimeListToJson)
  List<DateTime>? get lesson_times;
  @override
  int? get student_count;
  @override
  double? get avg_term_score;
  @override
  String? get avg_term_expectation_level;
  @override
  double? get avg_mtihani_score;
  @override
  String? get avg_mtihani_expectation_level;
  @override
  String? get student_code;
  @override
  List<TermScore>? get term_scores;

  /// Create a copy of ClassroomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassroomModelImplCopyWith<_$ClassroomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) {
  return _StudentModel.fromJson(json);
}

/// @nodoc
mixin _$StudentModel {
  int? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  double? get avg_score => throw _privateConstructorUsedError;
  String? get avg_expectation_level => throw _privateConstructorUsedError;
  double? get avg_mtihani_score => throw _privateConstructorUsedError;
  String? get avg_mtihani_expectation_level =>
      throw _privateConstructorUsedError;
  List<TermScore>? get term_scores => throw _privateConstructorUsedError;
  int? get classroom_id => throw _privateConstructorUsedError;
  String? get classroom_name => throw _privateConstructorUsedError;

  /// Serializes this StudentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentModelCopyWith<StudentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentModelCopyWith<$Res> {
  factory $StudentModelCopyWith(
          StudentModel value, $Res Function(StudentModel) then) =
      _$StudentModelCopyWithImpl<$Res, StudentModel>;
  @useResult
  $Res call(
      {int? id,
      String? code,
      String? name,
      String? status,
      double? avg_score,
      String? avg_expectation_level,
      double? avg_mtihani_score,
      String? avg_mtihani_expectation_level,
      List<TermScore>? term_scores,
      int? classroom_id,
      String? classroom_name});
}

/// @nodoc
class _$StudentModelCopyWithImpl<$Res, $Val extends StudentModel>
    implements $StudentModelCopyWith<$Res> {
  _$StudentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? avg_score = freezed,
    Object? avg_expectation_level = freezed,
    Object? avg_mtihani_score = freezed,
    Object? avg_mtihani_expectation_level = freezed,
    Object? term_scores = freezed,
    Object? classroom_id = freezed,
    Object? classroom_name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_expectation_level: freezed == avg_expectation_level
          ? _value.avg_expectation_level
          : avg_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_mtihani_score: freezed == avg_mtihani_score
          ? _value.avg_mtihani_score
          : avg_mtihani_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_mtihani_expectation_level: freezed == avg_mtihani_expectation_level
          ? _value.avg_mtihani_expectation_level
          : avg_mtihani_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      term_scores: freezed == term_scores
          ? _value.term_scores
          : term_scores // ignore: cast_nullable_to_non_nullable
              as List<TermScore>?,
      classroom_id: freezed == classroom_id
          ? _value.classroom_id
          : classroom_id // ignore: cast_nullable_to_non_nullable
              as int?,
      classroom_name: freezed == classroom_name
          ? _value.classroom_name
          : classroom_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentModelImplCopyWith<$Res>
    implements $StudentModelCopyWith<$Res> {
  factory _$$StudentModelImplCopyWith(
          _$StudentModelImpl value, $Res Function(_$StudentModelImpl) then) =
      __$$StudentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? code,
      String? name,
      String? status,
      double? avg_score,
      String? avg_expectation_level,
      double? avg_mtihani_score,
      String? avg_mtihani_expectation_level,
      List<TermScore>? term_scores,
      int? classroom_id,
      String? classroom_name});
}

/// @nodoc
class __$$StudentModelImplCopyWithImpl<$Res>
    extends _$StudentModelCopyWithImpl<$Res, _$StudentModelImpl>
    implements _$$StudentModelImplCopyWith<$Res> {
  __$$StudentModelImplCopyWithImpl(
      _$StudentModelImpl _value, $Res Function(_$StudentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? avg_score = freezed,
    Object? avg_expectation_level = freezed,
    Object? avg_mtihani_score = freezed,
    Object? avg_mtihani_expectation_level = freezed,
    Object? term_scores = freezed,
    Object? classroom_id = freezed,
    Object? classroom_name = freezed,
  }) {
    return _then(_$StudentModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_score: freezed == avg_score
          ? _value.avg_score
          : avg_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_expectation_level: freezed == avg_expectation_level
          ? _value.avg_expectation_level
          : avg_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_mtihani_score: freezed == avg_mtihani_score
          ? _value.avg_mtihani_score
          : avg_mtihani_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_mtihani_expectation_level: freezed == avg_mtihani_expectation_level
          ? _value.avg_mtihani_expectation_level
          : avg_mtihani_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      term_scores: freezed == term_scores
          ? _value._term_scores
          : term_scores // ignore: cast_nullable_to_non_nullable
              as List<TermScore>?,
      classroom_id: freezed == classroom_id
          ? _value.classroom_id
          : classroom_id // ignore: cast_nullable_to_non_nullable
              as int?,
      classroom_name: freezed == classroom_name
          ? _value.classroom_name
          : classroom_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentModelImpl implements _StudentModel {
  _$StudentModelImpl(
      {this.id,
      this.code,
      this.name,
      this.status,
      this.avg_score,
      this.avg_expectation_level,
      this.avg_mtihani_score,
      this.avg_mtihani_expectation_level,
      final List<TermScore>? term_scores,
      this.classroom_id,
      this.classroom_name})
      : _term_scores = term_scores;

  factory _$StudentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? status;
  @override
  final double? avg_score;
  @override
  final String? avg_expectation_level;
  @override
  final double? avg_mtihani_score;
  @override
  final String? avg_mtihani_expectation_level;
  final List<TermScore>? _term_scores;
  @override
  List<TermScore>? get term_scores {
    final value = _term_scores;
    if (value == null) return null;
    if (_term_scores is EqualUnmodifiableListView) return _term_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? classroom_id;
  @override
  final String? classroom_name;

  @override
  String toString() {
    return 'StudentModel(id: $id, code: $code, name: $name, status: $status, avg_score: $avg_score, avg_expectation_level: $avg_expectation_level, avg_mtihani_score: $avg_mtihani_score, avg_mtihani_expectation_level: $avg_mtihani_expectation_level, term_scores: $term_scores, classroom_id: $classroom_id, classroom_name: $classroom_name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.avg_score, avg_score) ||
                other.avg_score == avg_score) &&
            (identical(other.avg_expectation_level, avg_expectation_level) ||
                other.avg_expectation_level == avg_expectation_level) &&
            (identical(other.avg_mtihani_score, avg_mtihani_score) ||
                other.avg_mtihani_score == avg_mtihani_score) &&
            (identical(other.avg_mtihani_expectation_level,
                    avg_mtihani_expectation_level) ||
                other.avg_mtihani_expectation_level ==
                    avg_mtihani_expectation_level) &&
            const DeepCollectionEquality()
                .equals(other._term_scores, _term_scores) &&
            (identical(other.classroom_id, classroom_id) ||
                other.classroom_id == classroom_id) &&
            (identical(other.classroom_name, classroom_name) ||
                other.classroom_name == classroom_name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      status,
      avg_score,
      avg_expectation_level,
      avg_mtihani_score,
      avg_mtihani_expectation_level,
      const DeepCollectionEquality().hash(_term_scores),
      classroom_id,
      classroom_name);

  /// Create a copy of StudentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentModelImplCopyWith<_$StudentModelImpl> get copyWith =>
      __$$StudentModelImplCopyWithImpl<_$StudentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentModelImplToJson(
      this,
    );
  }
}

abstract class _StudentModel implements StudentModel {
  factory _StudentModel(
      {final int? id,
      final String? code,
      final String? name,
      final String? status,
      final double? avg_score,
      final String? avg_expectation_level,
      final double? avg_mtihani_score,
      final String? avg_mtihani_expectation_level,
      final List<TermScore>? term_scores,
      final int? classroom_id,
      final String? classroom_name}) = _$StudentModelImpl;

  factory _StudentModel.fromJson(Map<String, dynamic> json) =
      _$StudentModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get status;
  @override
  double? get avg_score;
  @override
  String? get avg_expectation_level;
  @override
  double? get avg_mtihani_score;
  @override
  String? get avg_mtihani_expectation_level;
  @override
  List<TermScore>? get term_scores;
  @override
  int? get classroom_id;
  @override
  String? get classroom_name;

  /// Create a copy of StudentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentModelImplCopyWith<_$StudentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClassPerformanceModel _$ClassPerformanceModelFromJson(
    Map<String, dynamic> json) {
  return _ClassPerformanceModel.fromJson(json);
}

/// @nodoc
mixin _$ClassPerformanceModel {
  double? get avg_term_score => throw _privateConstructorUsedError;
  String? get avg_term_expectation_level => throw _privateConstructorUsedError;
  double? get avg_mtihani_score => throw _privateConstructorUsedError;
  String? get avg_mtihani_expectation_level =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get grade_scores => throw _privateConstructorUsedError;
  List<ScoreModel>? get bloom_skill_scores =>
      throw _privateConstructorUsedError;
  List<ScoreModel>? get strand_scores => throw _privateConstructorUsedError;
  List<TermScore>? get class_term_scores => throw _privateConstructorUsedError;

  /// Serializes this ClassPerformanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassPerformanceModelCopyWith<ClassPerformanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassPerformanceModelCopyWith<$Res> {
  factory $ClassPerformanceModelCopyWith(ClassPerformanceModel value,
          $Res Function(ClassPerformanceModel) then) =
      _$ClassPerformanceModelCopyWithImpl<$Res, ClassPerformanceModel>;
  @useResult
  $Res call(
      {double? avg_term_score,
      String? avg_term_expectation_level,
      double? avg_mtihani_score,
      String? avg_mtihani_expectation_level,
      List<ScoreModel>? grade_scores,
      List<ScoreModel>? bloom_skill_scores,
      List<ScoreModel>? strand_scores,
      List<TermScore>? class_term_scores});
}

/// @nodoc
class _$ClassPerformanceModelCopyWithImpl<$Res,
        $Val extends ClassPerformanceModel>
    implements $ClassPerformanceModelCopyWith<$Res> {
  _$ClassPerformanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avg_term_score = freezed,
    Object? avg_term_expectation_level = freezed,
    Object? avg_mtihani_score = freezed,
    Object? avg_mtihani_expectation_level = freezed,
    Object? grade_scores = freezed,
    Object? bloom_skill_scores = freezed,
    Object? strand_scores = freezed,
    Object? class_term_scores = freezed,
  }) {
    return _then(_value.copyWith(
      avg_term_score: freezed == avg_term_score
          ? _value.avg_term_score
          : avg_term_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_term_expectation_level: freezed == avg_term_expectation_level
          ? _value.avg_term_expectation_level
          : avg_term_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_mtihani_score: freezed == avg_mtihani_score
          ? _value.avg_mtihani_score
          : avg_mtihani_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_mtihani_expectation_level: freezed == avg_mtihani_expectation_level
          ? _value.avg_mtihani_expectation_level
          : avg_mtihani_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
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
      class_term_scores: freezed == class_term_scores
          ? _value.class_term_scores
          : class_term_scores // ignore: cast_nullable_to_non_nullable
              as List<TermScore>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassPerformanceModelImplCopyWith<$Res>
    implements $ClassPerformanceModelCopyWith<$Res> {
  factory _$$ClassPerformanceModelImplCopyWith(
          _$ClassPerformanceModelImpl value,
          $Res Function(_$ClassPerformanceModelImpl) then) =
      __$$ClassPerformanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? avg_term_score,
      String? avg_term_expectation_level,
      double? avg_mtihani_score,
      String? avg_mtihani_expectation_level,
      List<ScoreModel>? grade_scores,
      List<ScoreModel>? bloom_skill_scores,
      List<ScoreModel>? strand_scores,
      List<TermScore>? class_term_scores});
}

/// @nodoc
class __$$ClassPerformanceModelImplCopyWithImpl<$Res>
    extends _$ClassPerformanceModelCopyWithImpl<$Res,
        _$ClassPerformanceModelImpl>
    implements _$$ClassPerformanceModelImplCopyWith<$Res> {
  __$$ClassPerformanceModelImplCopyWithImpl(_$ClassPerformanceModelImpl _value,
      $Res Function(_$ClassPerformanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avg_term_score = freezed,
    Object? avg_term_expectation_level = freezed,
    Object? avg_mtihani_score = freezed,
    Object? avg_mtihani_expectation_level = freezed,
    Object? grade_scores = freezed,
    Object? bloom_skill_scores = freezed,
    Object? strand_scores = freezed,
    Object? class_term_scores = freezed,
  }) {
    return _then(_$ClassPerformanceModelImpl(
      avg_term_score: freezed == avg_term_score
          ? _value.avg_term_score
          : avg_term_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_term_expectation_level: freezed == avg_term_expectation_level
          ? _value.avg_term_expectation_level
          : avg_term_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_mtihani_score: freezed == avg_mtihani_score
          ? _value.avg_mtihani_score
          : avg_mtihani_score // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_mtihani_expectation_level: freezed == avg_mtihani_expectation_level
          ? _value.avg_mtihani_expectation_level
          : avg_mtihani_expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
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
      class_term_scores: freezed == class_term_scores
          ? _value._class_term_scores
          : class_term_scores // ignore: cast_nullable_to_non_nullable
              as List<TermScore>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassPerformanceModelImpl implements _ClassPerformanceModel {
  _$ClassPerformanceModelImpl(
      {this.avg_term_score,
      this.avg_term_expectation_level,
      this.avg_mtihani_score,
      this.avg_mtihani_expectation_level,
      final List<ScoreModel>? grade_scores,
      final List<ScoreModel>? bloom_skill_scores,
      final List<ScoreModel>? strand_scores,
      final List<TermScore>? class_term_scores})
      : _grade_scores = grade_scores,
        _bloom_skill_scores = bloom_skill_scores,
        _strand_scores = strand_scores,
        _class_term_scores = class_term_scores;

  factory _$ClassPerformanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassPerformanceModelImplFromJson(json);

  @override
  final double? avg_term_score;
  @override
  final String? avg_term_expectation_level;
  @override
  final double? avg_mtihani_score;
  @override
  final String? avg_mtihani_expectation_level;
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

  final List<TermScore>? _class_term_scores;
  @override
  List<TermScore>? get class_term_scores {
    final value = _class_term_scores;
    if (value == null) return null;
    if (_class_term_scores is EqualUnmodifiableListView)
      return _class_term_scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClassPerformanceModel(avg_term_score: $avg_term_score, avg_term_expectation_level: $avg_term_expectation_level, avg_mtihani_score: $avg_mtihani_score, avg_mtihani_expectation_level: $avg_mtihani_expectation_level, grade_scores: $grade_scores, bloom_skill_scores: $bloom_skill_scores, strand_scores: $strand_scores, class_term_scores: $class_term_scores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassPerformanceModelImpl &&
            (identical(other.avg_term_score, avg_term_score) ||
                other.avg_term_score == avg_term_score) &&
            (identical(other.avg_term_expectation_level,
                    avg_term_expectation_level) ||
                other.avg_term_expectation_level ==
                    avg_term_expectation_level) &&
            (identical(other.avg_mtihani_score, avg_mtihani_score) ||
                other.avg_mtihani_score == avg_mtihani_score) &&
            (identical(other.avg_mtihani_expectation_level,
                    avg_mtihani_expectation_level) ||
                other.avg_mtihani_expectation_level ==
                    avg_mtihani_expectation_level) &&
            const DeepCollectionEquality()
                .equals(other._grade_scores, _grade_scores) &&
            const DeepCollectionEquality()
                .equals(other._bloom_skill_scores, _bloom_skill_scores) &&
            const DeepCollectionEquality()
                .equals(other._strand_scores, _strand_scores) &&
            const DeepCollectionEquality()
                .equals(other._class_term_scores, _class_term_scores));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      avg_term_score,
      avg_term_expectation_level,
      avg_mtihani_score,
      avg_mtihani_expectation_level,
      const DeepCollectionEquality().hash(_grade_scores),
      const DeepCollectionEquality().hash(_bloom_skill_scores),
      const DeepCollectionEquality().hash(_strand_scores),
      const DeepCollectionEquality().hash(_class_term_scores));

  /// Create a copy of ClassPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassPerformanceModelImplCopyWith<_$ClassPerformanceModelImpl>
      get copyWith => __$$ClassPerformanceModelImplCopyWithImpl<
          _$ClassPerformanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassPerformanceModelImplToJson(
      this,
    );
  }
}

abstract class _ClassPerformanceModel implements ClassPerformanceModel {
  factory _ClassPerformanceModel(
      {final double? avg_term_score,
      final String? avg_term_expectation_level,
      final double? avg_mtihani_score,
      final String? avg_mtihani_expectation_level,
      final List<ScoreModel>? grade_scores,
      final List<ScoreModel>? bloom_skill_scores,
      final List<ScoreModel>? strand_scores,
      final List<TermScore>? class_term_scores}) = _$ClassPerformanceModelImpl;

  factory _ClassPerformanceModel.fromJson(Map<String, dynamic> json) =
      _$ClassPerformanceModelImpl.fromJson;

  @override
  double? get avg_term_score;
  @override
  String? get avg_term_expectation_level;
  @override
  double? get avg_mtihani_score;
  @override
  String? get avg_mtihani_expectation_level;
  @override
  List<ScoreModel>? get grade_scores;
  @override
  List<ScoreModel>? get bloom_skill_scores;
  @override
  List<ScoreModel>? get strand_scores;
  @override
  List<TermScore>? get class_term_scores;

  /// Create a copy of ClassPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassPerformanceModelImplCopyWith<_$ClassPerformanceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TermScore _$TermScoreFromJson(Map<String, dynamic> json) {
  return _TermScore.fromJson(json);
}

/// @nodoc
mixin _$TermScore {
  int? get id => throw _privateConstructorUsedError;
  int? get grade => throw _privateConstructorUsedError;
  int? get term => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  String? get expectation_level => throw _privateConstructorUsedError;

  /// Serializes this TermScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TermScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TermScoreCopyWith<TermScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermScoreCopyWith<$Res> {
  factory $TermScoreCopyWith(TermScore value, $Res Function(TermScore) then) =
      _$TermScoreCopyWithImpl<$Res, TermScore>;
  @useResult
  $Res call(
      {int? id,
      int? grade,
      int? term,
      double? score,
      String? expectation_level});
}

/// @nodoc
class _$TermScoreCopyWithImpl<$Res, $Val extends TermScore>
    implements $TermScoreCopyWith<$Res> {
  _$TermScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TermScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? grade = freezed,
    Object? term = freezed,
    Object? score = freezed,
    Object? expectation_level = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      term: freezed == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      expectation_level: freezed == expectation_level
          ? _value.expectation_level
          : expectation_level // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermScoreImplCopyWith<$Res>
    implements $TermScoreCopyWith<$Res> {
  factory _$$TermScoreImplCopyWith(
          _$TermScoreImpl value, $Res Function(_$TermScoreImpl) then) =
      __$$TermScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? grade,
      int? term,
      double? score,
      String? expectation_level});
}

/// @nodoc
class __$$TermScoreImplCopyWithImpl<$Res>
    extends _$TermScoreCopyWithImpl<$Res, _$TermScoreImpl>
    implements _$$TermScoreImplCopyWith<$Res> {
  __$$TermScoreImplCopyWithImpl(
      _$TermScoreImpl _value, $Res Function(_$TermScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of TermScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? grade = freezed,
    Object? term = freezed,
    Object? score = freezed,
    Object? expectation_level = freezed,
  }) {
    return _then(_$TermScoreImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      term: freezed == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
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
class _$TermScoreImpl implements _TermScore {
  _$TermScoreImpl(
      {this.id, this.grade, this.term, this.score, this.expectation_level});

  factory _$TermScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$TermScoreImplFromJson(json);

  @override
  final int? id;
  @override
  final int? grade;
  @override
  final int? term;
  @override
  final double? score;
  @override
  final String? expectation_level;

  @override
  String toString() {
    return 'TermScore(id: $id, grade: $grade, term: $term, score: $score, expectation_level: $expectation_level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermScoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.expectation_level, expectation_level) ||
                other.expectation_level == expectation_level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, grade, term, score, expectation_level);

  /// Create a copy of TermScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TermScoreImplCopyWith<_$TermScoreImpl> get copyWith =>
      __$$TermScoreImplCopyWithImpl<_$TermScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TermScoreImplToJson(
      this,
    );
  }
}

abstract class _TermScore implements TermScore {
  factory _TermScore(
      {final int? id,
      final int? grade,
      final int? term,
      final double? score,
      final String? expectation_level}) = _$TermScoreImpl;

  factory _TermScore.fromJson(Map<String, dynamic> json) =
      _$TermScoreImpl.fromJson;

  @override
  int? get id;
  @override
  int? get grade;
  @override
  int? get term;
  @override
  double? get score;
  @override
  String? get expectation_level;

  /// Create a copy of TermScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TermScoreImplCopyWith<_$TermScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
