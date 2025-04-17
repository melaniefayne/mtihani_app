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
  String? get code => throw _privateConstructorUsedError;
  TeacherModel? get teacher => throw _privateConstructorUsedError;
  List<DateTime>? get lessons_times => throw _privateConstructorUsedError;
  int? get student_count => throw _privateConstructorUsedError;
  double? get avg_term_score => throw _privateConstructorUsedError;
  String? get avg_term_expectation_level => throw _privateConstructorUsedError;
  double? get avg_mtihani_score => throw _privateConstructorUsedError;
  String? get avg_mtihani_expectation_level =>
      throw _privateConstructorUsedError;

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
      String? code,
      TeacherModel? teacher,
      List<DateTime>? lessons_times,
      int? student_count,
      double? avg_term_score,
      String? avg_term_expectation_level,
      double? avg_mtihani_score,
      String? avg_mtihani_expectation_level});

  $TeacherModelCopyWith<$Res>? get teacher;
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
    Object? code = freezed,
    Object? teacher = freezed,
    Object? lessons_times = freezed,
    Object? student_count = freezed,
    Object? avg_term_score = freezed,
    Object? avg_term_expectation_level = freezed,
    Object? avg_mtihani_score = freezed,
    Object? avg_mtihani_expectation_level = freezed,
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
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as TeacherModel?,
      lessons_times: freezed == lessons_times
          ? _value.lessons_times
          : lessons_times // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }

  /// Create a copy of ClassroomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherModelCopyWith<$Res>? get teacher {
    if (_value.teacher == null) {
      return null;
    }

    return $TeacherModelCopyWith<$Res>(_value.teacher!, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
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
      String? code,
      TeacherModel? teacher,
      List<DateTime>? lessons_times,
      int? student_count,
      double? avg_term_score,
      String? avg_term_expectation_level,
      double? avg_mtihani_score,
      String? avg_mtihani_expectation_level});

  @override
  $TeacherModelCopyWith<$Res>? get teacher;
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
    Object? code = freezed,
    Object? teacher = freezed,
    Object? lessons_times = freezed,
    Object? student_count = freezed,
    Object? avg_term_score = freezed,
    Object? avg_term_expectation_level = freezed,
    Object? avg_mtihani_score = freezed,
    Object? avg_mtihani_expectation_level = freezed,
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
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as TeacherModel?,
      lessons_times: freezed == lessons_times
          ? _value._lessons_times
          : lessons_times // ignore: cast_nullable_to_non_nullable
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
      this.code,
      this.teacher,
      final List<DateTime>? lessons_times,
      this.student_count,
      this.avg_term_score,
      this.avg_term_expectation_level,
      this.avg_mtihani_score,
      this.avg_mtihani_expectation_level})
      : _lessons_times = lessons_times;

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
  final String? code;
  @override
  final TeacherModel? teacher;
  final List<DateTime>? _lessons_times;
  @override
  List<DateTime>? get lessons_times {
    final value = _lessons_times;
    if (value == null) return null;
    if (_lessons_times is EqualUnmodifiableListView) return _lessons_times;
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
  String toString() {
    return 'ClassroomModel(id: $id, name: $name, school_name: $school_name, school_address: $school_address, subject: $subject, grade: $grade, code: $code, teacher: $teacher, lessons_times: $lessons_times, student_count: $student_count, avg_term_score: $avg_term_score, avg_term_expectation_level: $avg_term_expectation_level, avg_mtihani_score: $avg_mtihani_score, avg_mtihani_expectation_level: $avg_mtihani_expectation_level)';
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
            (identical(other.code, code) || other.code == code) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            const DeepCollectionEquality()
                .equals(other._lessons_times, _lessons_times) &&
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
                    avg_mtihani_expectation_level));
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
      code,
      teacher,
      const DeepCollectionEquality().hash(_lessons_times),
      student_count,
      avg_term_score,
      avg_term_expectation_level,
      avg_mtihani_score,
      avg_mtihani_expectation_level);

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
      final String? code,
      final TeacherModel? teacher,
      final List<DateTime>? lessons_times,
      final int? student_count,
      final double? avg_term_score,
      final String? avg_term_expectation_level,
      final double? avg_mtihani_score,
      final String? avg_mtihani_expectation_level}) = _$ClassroomModelImpl;

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
  String? get code;
  @override
  TeacherModel? get teacher;
  @override
  List<DateTime>? get lessons_times;
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

  /// Create a copy of ClassroomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassroomModelImplCopyWith<_$ClassroomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
