// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cbc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GradeModel _$GradeModelFromJson(Map<String, dynamic> json) {
  return _GradeModel.fromJson(json);
}

/// @nodoc
mixin _$GradeModel {
  int? get grade => throw _privateConstructorUsedError;
  List<StrandModel>? get strands => throw _privateConstructorUsedError;

  /// Serializes this GradeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GradeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GradeModelCopyWith<GradeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeModelCopyWith<$Res> {
  factory $GradeModelCopyWith(
          GradeModel value, $Res Function(GradeModel) then) =
      _$GradeModelCopyWithImpl<$Res, GradeModel>;
  @useResult
  $Res call({int? grade, List<StrandModel>? strands});
}

/// @nodoc
class _$GradeModelCopyWithImpl<$Res, $Val extends GradeModel>
    implements $GradeModelCopyWith<$Res> {
  _$GradeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GradeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grade = freezed,
    Object? strands = freezed,
  }) {
    return _then(_value.copyWith(
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      strands: freezed == strands
          ? _value.strands
          : strands // ignore: cast_nullable_to_non_nullable
              as List<StrandModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GradeModelImplCopyWith<$Res>
    implements $GradeModelCopyWith<$Res> {
  factory _$$GradeModelImplCopyWith(
          _$GradeModelImpl value, $Res Function(_$GradeModelImpl) then) =
      __$$GradeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? grade, List<StrandModel>? strands});
}

/// @nodoc
class __$$GradeModelImplCopyWithImpl<$Res>
    extends _$GradeModelCopyWithImpl<$Res, _$GradeModelImpl>
    implements _$$GradeModelImplCopyWith<$Res> {
  __$$GradeModelImplCopyWithImpl(
      _$GradeModelImpl _value, $Res Function(_$GradeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GradeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grade = freezed,
    Object? strands = freezed,
  }) {
    return _then(_$GradeModelImpl(
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      strands: freezed == strands
          ? _value._strands
          : strands // ignore: cast_nullable_to_non_nullable
              as List<StrandModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GradeModelImpl implements _GradeModel {
  _$GradeModelImpl({this.grade, final List<StrandModel>? strands})
      : _strands = strands;

  factory _$GradeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GradeModelImplFromJson(json);

  @override
  final int? grade;
  final List<StrandModel>? _strands;
  @override
  List<StrandModel>? get strands {
    final value = _strands;
    if (value == null) return null;
    if (_strands is EqualUnmodifiableListView) return _strands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GradeModel(grade: $grade, strands: $strands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeModelImpl &&
            (identical(other.grade, grade) || other.grade == grade) &&
            const DeepCollectionEquality().equals(other._strands, _strands));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, grade, const DeepCollectionEquality().hash(_strands));

  /// Create a copy of GradeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeModelImplCopyWith<_$GradeModelImpl> get copyWith =>
      __$$GradeModelImplCopyWithImpl<_$GradeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GradeModelImplToJson(
      this,
    );
  }
}

abstract class _GradeModel implements GradeModel {
  factory _GradeModel({final int? grade, final List<StrandModel>? strands}) =
      _$GradeModelImpl;

  factory _GradeModel.fromJson(Map<String, dynamic> json) =
      _$GradeModelImpl.fromJson;

  @override
  int? get grade;
  @override
  List<StrandModel>? get strands;

  /// Create a copy of GradeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GradeModelImplCopyWith<_$GradeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StrandModel _$StrandModelFromJson(Map<String, dynamic> json) {
  return _StrandModel.fromJson(json);
}

/// @nodoc
mixin _$StrandModel {
  int? get id => throw _privateConstructorUsedError;
  int? get grade => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get number => throw _privateConstructorUsedError;
  List<SubStrandModel>? get sub_strands => throw _privateConstructorUsedError;

  /// Serializes this StrandModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrandModelCopyWith<StrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrandModelCopyWith<$Res> {
  factory $StrandModelCopyWith(
          StrandModel value, $Res Function(StrandModel) then) =
      _$StrandModelCopyWithImpl<$Res, StrandModel>;
  @useResult
  $Res call(
      {int? id,
      int? grade,
      String? name,
      double? number,
      List<SubStrandModel>? sub_strands});
}

/// @nodoc
class _$StrandModelCopyWithImpl<$Res, $Val extends StrandModel>
    implements $StrandModelCopyWith<$Res> {
  _$StrandModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? grade = freezed,
    Object? name = freezed,
    Object? number = freezed,
    Object? sub_strands = freezed,
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
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as double?,
      sub_strands: freezed == sub_strands
          ? _value.sub_strands
          : sub_strands // ignore: cast_nullable_to_non_nullable
              as List<SubStrandModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StrandModelImplCopyWith<$Res>
    implements $StrandModelCopyWith<$Res> {
  factory _$$StrandModelImplCopyWith(
          _$StrandModelImpl value, $Res Function(_$StrandModelImpl) then) =
      __$$StrandModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? grade,
      String? name,
      double? number,
      List<SubStrandModel>? sub_strands});
}

/// @nodoc
class __$$StrandModelImplCopyWithImpl<$Res>
    extends _$StrandModelCopyWithImpl<$Res, _$StrandModelImpl>
    implements _$$StrandModelImplCopyWith<$Res> {
  __$$StrandModelImplCopyWithImpl(
      _$StrandModelImpl _value, $Res Function(_$StrandModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? grade = freezed,
    Object? name = freezed,
    Object? number = freezed,
    Object? sub_strands = freezed,
  }) {
    return _then(_$StrandModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as double?,
      sub_strands: freezed == sub_strands
          ? _value._sub_strands
          : sub_strands // ignore: cast_nullable_to_non_nullable
              as List<SubStrandModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrandModelImpl implements _StrandModel {
  _$StrandModelImpl(
      {this.id,
      this.grade,
      this.name,
      this.number,
      final List<SubStrandModel>? sub_strands})
      : _sub_strands = sub_strands;

  factory _$StrandModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrandModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? grade;
  @override
  final String? name;
  @override
  final double? number;
  final List<SubStrandModel>? _sub_strands;
  @override
  List<SubStrandModel>? get sub_strands {
    final value = _sub_strands;
    if (value == null) return null;
    if (_sub_strands is EqualUnmodifiableListView) return _sub_strands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StrandModel(id: $id, grade: $grade, name: $name, number: $number, sub_strands: $sub_strands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrandModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality()
                .equals(other._sub_strands, _sub_strands));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, grade, name, number,
      const DeepCollectionEquality().hash(_sub_strands));

  /// Create a copy of StrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrandModelImplCopyWith<_$StrandModelImpl> get copyWith =>
      __$$StrandModelImplCopyWithImpl<_$StrandModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrandModelImplToJson(
      this,
    );
  }
}

abstract class _StrandModel implements StrandModel {
  factory _StrandModel(
      {final int? id,
      final int? grade,
      final String? name,
      final double? number,
      final List<SubStrandModel>? sub_strands}) = _$StrandModelImpl;

  factory _StrandModel.fromJson(Map<String, dynamic> json) =
      _$StrandModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get grade;
  @override
  String? get name;
  @override
  double? get number;
  @override
  List<SubStrandModel>? get sub_strands;

  /// Create a copy of StrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrandModelImplCopyWith<_$StrandModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubStrandModel _$SubStrandModelFromJson(Map<String, dynamic> json) {
  return _SubStrandModel.fromJson(json);
}

/// @nodoc
mixin _$SubStrandModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get number => throw _privateConstructorUsedError;
  int? get lesson_count => throw _privateConstructorUsedError;
  List<String>? get key_inquiries => throw _privateConstructorUsedError;
  List<String>? get learning_outcomes => throw _privateConstructorUsedError;
  List<String>? get learning_experiences => throw _privateConstructorUsedError;
  List<String>? get descriptions => throw _privateConstructorUsedError;
  List<String>? get core_competencies => throw _privateConstructorUsedError;
  List<String>? get values => throw _privateConstructorUsedError;
  List<String>? get pertinent_issues => throw _privateConstructorUsedError;
  List<String>? get other_learning_areas => throw _privateConstructorUsedError;
  List<String>? get learning_materials => throw _privateConstructorUsedError;
  List<String>? get non_formal_activities => throw _privateConstructorUsedError;
  List<SubStrandSkillModel>? get skills => throw _privateConstructorUsedError;

  /// Serializes this SubStrandModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubStrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubStrandModelCopyWith<SubStrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubStrandModelCopyWith<$Res> {
  factory $SubStrandModelCopyWith(
          SubStrandModel value, $Res Function(SubStrandModel) then) =
      _$SubStrandModelCopyWithImpl<$Res, SubStrandModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      double? number,
      int? lesson_count,
      List<String>? key_inquiries,
      List<String>? learning_outcomes,
      List<String>? learning_experiences,
      List<String>? descriptions,
      List<String>? core_competencies,
      List<String>? values,
      List<String>? pertinent_issues,
      List<String>? other_learning_areas,
      List<String>? learning_materials,
      List<String>? non_formal_activities,
      List<SubStrandSkillModel>? skills});
}

/// @nodoc
class _$SubStrandModelCopyWithImpl<$Res, $Val extends SubStrandModel>
    implements $SubStrandModelCopyWith<$Res> {
  _$SubStrandModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubStrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? number = freezed,
    Object? lesson_count = freezed,
    Object? key_inquiries = freezed,
    Object? learning_outcomes = freezed,
    Object? learning_experiences = freezed,
    Object? descriptions = freezed,
    Object? core_competencies = freezed,
    Object? values = freezed,
    Object? pertinent_issues = freezed,
    Object? other_learning_areas = freezed,
    Object? learning_materials = freezed,
    Object? non_formal_activities = freezed,
    Object? skills = freezed,
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
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as double?,
      lesson_count: freezed == lesson_count
          ? _value.lesson_count
          : lesson_count // ignore: cast_nullable_to_non_nullable
              as int?,
      key_inquiries: freezed == key_inquiries
          ? _value.key_inquiries
          : key_inquiries // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      learning_outcomes: freezed == learning_outcomes
          ? _value.learning_outcomes
          : learning_outcomes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      learning_experiences: freezed == learning_experiences
          ? _value.learning_experiences
          : learning_experiences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      core_competencies: freezed == core_competencies
          ? _value.core_competencies
          : core_competencies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pertinent_issues: freezed == pertinent_issues
          ? _value.pertinent_issues
          : pertinent_issues // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      other_learning_areas: freezed == other_learning_areas
          ? _value.other_learning_areas
          : other_learning_areas // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      learning_materials: freezed == learning_materials
          ? _value.learning_materials
          : learning_materials // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      non_formal_activities: freezed == non_formal_activities
          ? _value.non_formal_activities
          : non_formal_activities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<SubStrandSkillModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubStrandModelImplCopyWith<$Res>
    implements $SubStrandModelCopyWith<$Res> {
  factory _$$SubStrandModelImplCopyWith(_$SubStrandModelImpl value,
          $Res Function(_$SubStrandModelImpl) then) =
      __$$SubStrandModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      double? number,
      int? lesson_count,
      List<String>? key_inquiries,
      List<String>? learning_outcomes,
      List<String>? learning_experiences,
      List<String>? descriptions,
      List<String>? core_competencies,
      List<String>? values,
      List<String>? pertinent_issues,
      List<String>? other_learning_areas,
      List<String>? learning_materials,
      List<String>? non_formal_activities,
      List<SubStrandSkillModel>? skills});
}

/// @nodoc
class __$$SubStrandModelImplCopyWithImpl<$Res>
    extends _$SubStrandModelCopyWithImpl<$Res, _$SubStrandModelImpl>
    implements _$$SubStrandModelImplCopyWith<$Res> {
  __$$SubStrandModelImplCopyWithImpl(
      _$SubStrandModelImpl _value, $Res Function(_$SubStrandModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubStrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? number = freezed,
    Object? lesson_count = freezed,
    Object? key_inquiries = freezed,
    Object? learning_outcomes = freezed,
    Object? learning_experiences = freezed,
    Object? descriptions = freezed,
    Object? core_competencies = freezed,
    Object? values = freezed,
    Object? pertinent_issues = freezed,
    Object? other_learning_areas = freezed,
    Object? learning_materials = freezed,
    Object? non_formal_activities = freezed,
    Object? skills = freezed,
  }) {
    return _then(_$SubStrandModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as double?,
      lesson_count: freezed == lesson_count
          ? _value.lesson_count
          : lesson_count // ignore: cast_nullable_to_non_nullable
              as int?,
      key_inquiries: freezed == key_inquiries
          ? _value._key_inquiries
          : key_inquiries // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      learning_outcomes: freezed == learning_outcomes
          ? _value._learning_outcomes
          : learning_outcomes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      learning_experiences: freezed == learning_experiences
          ? _value._learning_experiences
          : learning_experiences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      descriptions: freezed == descriptions
          ? _value._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      core_competencies: freezed == core_competencies
          ? _value._core_competencies
          : core_competencies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      values: freezed == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pertinent_issues: freezed == pertinent_issues
          ? _value._pertinent_issues
          : pertinent_issues // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      other_learning_areas: freezed == other_learning_areas
          ? _value._other_learning_areas
          : other_learning_areas // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      learning_materials: freezed == learning_materials
          ? _value._learning_materials
          : learning_materials // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      non_formal_activities: freezed == non_formal_activities
          ? _value._non_formal_activities
          : non_formal_activities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<SubStrandSkillModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubStrandModelImpl implements _SubStrandModel {
  _$SubStrandModelImpl(
      {this.id,
      this.name,
      this.number,
      this.lesson_count,
      final List<String>? key_inquiries,
      final List<String>? learning_outcomes,
      final List<String>? learning_experiences,
      final List<String>? descriptions,
      final List<String>? core_competencies,
      final List<String>? values,
      final List<String>? pertinent_issues,
      final List<String>? other_learning_areas,
      final List<String>? learning_materials,
      final List<String>? non_formal_activities,
      final List<SubStrandSkillModel>? skills})
      : _key_inquiries = key_inquiries,
        _learning_outcomes = learning_outcomes,
        _learning_experiences = learning_experiences,
        _descriptions = descriptions,
        _core_competencies = core_competencies,
        _values = values,
        _pertinent_issues = pertinent_issues,
        _other_learning_areas = other_learning_areas,
        _learning_materials = learning_materials,
        _non_formal_activities = non_formal_activities,
        _skills = skills;

  factory _$SubStrandModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubStrandModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? number;
  @override
  final int? lesson_count;
  final List<String>? _key_inquiries;
  @override
  List<String>? get key_inquiries {
    final value = _key_inquiries;
    if (value == null) return null;
    if (_key_inquiries is EqualUnmodifiableListView) return _key_inquiries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _learning_outcomes;
  @override
  List<String>? get learning_outcomes {
    final value = _learning_outcomes;
    if (value == null) return null;
    if (_learning_outcomes is EqualUnmodifiableListView)
      return _learning_outcomes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _learning_experiences;
  @override
  List<String>? get learning_experiences {
    final value = _learning_experiences;
    if (value == null) return null;
    if (_learning_experiences is EqualUnmodifiableListView)
      return _learning_experiences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _descriptions;
  @override
  List<String>? get descriptions {
    final value = _descriptions;
    if (value == null) return null;
    if (_descriptions is EqualUnmodifiableListView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _core_competencies;
  @override
  List<String>? get core_competencies {
    final value = _core_competencies;
    if (value == null) return null;
    if (_core_competencies is EqualUnmodifiableListView)
      return _core_competencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _values;
  @override
  List<String>? get values {
    final value = _values;
    if (value == null) return null;
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _pertinent_issues;
  @override
  List<String>? get pertinent_issues {
    final value = _pertinent_issues;
    if (value == null) return null;
    if (_pertinent_issues is EqualUnmodifiableListView)
      return _pertinent_issues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _other_learning_areas;
  @override
  List<String>? get other_learning_areas {
    final value = _other_learning_areas;
    if (value == null) return null;
    if (_other_learning_areas is EqualUnmodifiableListView)
      return _other_learning_areas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _learning_materials;
  @override
  List<String>? get learning_materials {
    final value = _learning_materials;
    if (value == null) return null;
    if (_learning_materials is EqualUnmodifiableListView)
      return _learning_materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _non_formal_activities;
  @override
  List<String>? get non_formal_activities {
    final value = _non_formal_activities;
    if (value == null) return null;
    if (_non_formal_activities is EqualUnmodifiableListView)
      return _non_formal_activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SubStrandSkillModel>? _skills;
  @override
  List<SubStrandSkillModel>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubStrandModel(id: $id, name: $name, number: $number, lesson_count: $lesson_count, key_inquiries: $key_inquiries, learning_outcomes: $learning_outcomes, learning_experiences: $learning_experiences, descriptions: $descriptions, core_competencies: $core_competencies, values: $values, pertinent_issues: $pertinent_issues, other_learning_areas: $other_learning_areas, learning_materials: $learning_materials, non_formal_activities: $non_formal_activities, skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubStrandModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.lesson_count, lesson_count) ||
                other.lesson_count == lesson_count) &&
            const DeepCollectionEquality()
                .equals(other._key_inquiries, _key_inquiries) &&
            const DeepCollectionEquality()
                .equals(other._learning_outcomes, _learning_outcomes) &&
            const DeepCollectionEquality()
                .equals(other._learning_experiences, _learning_experiences) &&
            const DeepCollectionEquality()
                .equals(other._descriptions, _descriptions) &&
            const DeepCollectionEquality()
                .equals(other._core_competencies, _core_competencies) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            const DeepCollectionEquality()
                .equals(other._pertinent_issues, _pertinent_issues) &&
            const DeepCollectionEquality()
                .equals(other._other_learning_areas, _other_learning_areas) &&
            const DeepCollectionEquality()
                .equals(other._learning_materials, _learning_materials) &&
            const DeepCollectionEquality()
                .equals(other._non_formal_activities, _non_formal_activities) &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      number,
      lesson_count,
      const DeepCollectionEquality().hash(_key_inquiries),
      const DeepCollectionEquality().hash(_learning_outcomes),
      const DeepCollectionEquality().hash(_learning_experiences),
      const DeepCollectionEquality().hash(_descriptions),
      const DeepCollectionEquality().hash(_core_competencies),
      const DeepCollectionEquality().hash(_values),
      const DeepCollectionEquality().hash(_pertinent_issues),
      const DeepCollectionEquality().hash(_other_learning_areas),
      const DeepCollectionEquality().hash(_learning_materials),
      const DeepCollectionEquality().hash(_non_formal_activities),
      const DeepCollectionEquality().hash(_skills));

  /// Create a copy of SubStrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubStrandModelImplCopyWith<_$SubStrandModelImpl> get copyWith =>
      __$$SubStrandModelImplCopyWithImpl<_$SubStrandModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubStrandModelImplToJson(
      this,
    );
  }
}

abstract class _SubStrandModel implements SubStrandModel {
  factory _SubStrandModel(
      {final int? id,
      final String? name,
      final double? number,
      final int? lesson_count,
      final List<String>? key_inquiries,
      final List<String>? learning_outcomes,
      final List<String>? learning_experiences,
      final List<String>? descriptions,
      final List<String>? core_competencies,
      final List<String>? values,
      final List<String>? pertinent_issues,
      final List<String>? other_learning_areas,
      final List<String>? learning_materials,
      final List<String>? non_formal_activities,
      final List<SubStrandSkillModel>? skills}) = _$SubStrandModelImpl;

  factory _SubStrandModel.fromJson(Map<String, dynamic> json) =
      _$SubStrandModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  double? get number;
  @override
  int? get lesson_count;
  @override
  List<String>? get key_inquiries;
  @override
  List<String>? get learning_outcomes;
  @override
  List<String>? get learning_experiences;
  @override
  List<String>? get descriptions;
  @override
  List<String>? get core_competencies;
  @override
  List<String>? get values;
  @override
  List<String>? get pertinent_issues;
  @override
  List<String>? get other_learning_areas;
  @override
  List<String>? get learning_materials;
  @override
  List<String>? get non_formal_activities;
  @override
  List<SubStrandSkillModel>? get skills;

  /// Create a copy of SubStrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubStrandModelImplCopyWith<_$SubStrandModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubStrandSkillModel _$SubStrandSkillModelFromJson(Map<String, dynamic> json) {
  return _SubStrandSkillModel.fromJson(json);
}

/// @nodoc
mixin _$SubStrandSkillModel {
  int? get id => throw _privateConstructorUsedError;
  String? get skill => throw _privateConstructorUsedError;
  List<SkillRubricModel>? get skillRubrics =>
      throw _privateConstructorUsedError;

  /// Serializes this SubStrandSkillModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubStrandSkillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubStrandSkillModelCopyWith<SubStrandSkillModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubStrandSkillModelCopyWith<$Res> {
  factory $SubStrandSkillModelCopyWith(
          SubStrandSkillModel value, $Res Function(SubStrandSkillModel) then) =
      _$SubStrandSkillModelCopyWithImpl<$Res, SubStrandSkillModel>;
  @useResult
  $Res call({int? id, String? skill, List<SkillRubricModel>? skillRubrics});
}

/// @nodoc
class _$SubStrandSkillModelCopyWithImpl<$Res, $Val extends SubStrandSkillModel>
    implements $SubStrandSkillModelCopyWith<$Res> {
  _$SubStrandSkillModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubStrandSkillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? skill = freezed,
    Object? skillRubrics = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      skill: freezed == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as String?,
      skillRubrics: freezed == skillRubrics
          ? _value.skillRubrics
          : skillRubrics // ignore: cast_nullable_to_non_nullable
              as List<SkillRubricModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubStrandSkillModelImplCopyWith<$Res>
    implements $SubStrandSkillModelCopyWith<$Res> {
  factory _$$SubStrandSkillModelImplCopyWith(_$SubStrandSkillModelImpl value,
          $Res Function(_$SubStrandSkillModelImpl) then) =
      __$$SubStrandSkillModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? skill, List<SkillRubricModel>? skillRubrics});
}

/// @nodoc
class __$$SubStrandSkillModelImplCopyWithImpl<$Res>
    extends _$SubStrandSkillModelCopyWithImpl<$Res, _$SubStrandSkillModelImpl>
    implements _$$SubStrandSkillModelImplCopyWith<$Res> {
  __$$SubStrandSkillModelImplCopyWithImpl(_$SubStrandSkillModelImpl _value,
      $Res Function(_$SubStrandSkillModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubStrandSkillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? skill = freezed,
    Object? skillRubrics = freezed,
  }) {
    return _then(_$SubStrandSkillModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      skill: freezed == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as String?,
      skillRubrics: freezed == skillRubrics
          ? _value._skillRubrics
          : skillRubrics // ignore: cast_nullable_to_non_nullable
              as List<SkillRubricModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubStrandSkillModelImpl implements _SubStrandSkillModel {
  _$SubStrandSkillModelImpl(
      {this.id, this.skill, final List<SkillRubricModel>? skillRubrics})
      : _skillRubrics = skillRubrics;

  factory _$SubStrandSkillModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubStrandSkillModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? skill;
  final List<SkillRubricModel>? _skillRubrics;
  @override
  List<SkillRubricModel>? get skillRubrics {
    final value = _skillRubrics;
    if (value == null) return null;
    if (_skillRubrics is EqualUnmodifiableListView) return _skillRubrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubStrandSkillModel(id: $id, skill: $skill, skillRubrics: $skillRubrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubStrandSkillModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.skill, skill) || other.skill == skill) &&
            const DeepCollectionEquality()
                .equals(other._skillRubrics, _skillRubrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, skill,
      const DeepCollectionEquality().hash(_skillRubrics));

  /// Create a copy of SubStrandSkillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubStrandSkillModelImplCopyWith<_$SubStrandSkillModelImpl> get copyWith =>
      __$$SubStrandSkillModelImplCopyWithImpl<_$SubStrandSkillModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubStrandSkillModelImplToJson(
      this,
    );
  }
}

abstract class _SubStrandSkillModel implements SubStrandSkillModel {
  factory _SubStrandSkillModel(
      {final int? id,
      final String? skill,
      final List<SkillRubricModel>? skillRubrics}) = _$SubStrandSkillModelImpl;

  factory _SubStrandSkillModel.fromJson(Map<String, dynamic> json) =
      _$SubStrandSkillModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get skill;
  @override
  List<SkillRubricModel>? get skillRubrics;

  /// Create a copy of SubStrandSkillModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubStrandSkillModelImplCopyWith<_$SubStrandSkillModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SkillRubricModel _$SkillRubricModelFromJson(Map<String, dynamic> json) {
  return _SkillRubricModel.fromJson(json);
}

/// @nodoc
mixin _$SkillRubricModel {
  String? get expectation => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this SkillRubricModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkillRubricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillRubricModelCopyWith<SkillRubricModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillRubricModelCopyWith<$Res> {
  factory $SkillRubricModelCopyWith(
          SkillRubricModel value, $Res Function(SkillRubricModel) then) =
      _$SkillRubricModelCopyWithImpl<$Res, SkillRubricModel>;
  @useResult
  $Res call({String? expectation, String? description});
}

/// @nodoc
class _$SkillRubricModelCopyWithImpl<$Res, $Val extends SkillRubricModel>
    implements $SkillRubricModelCopyWith<$Res> {
  _$SkillRubricModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillRubricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expectation = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      expectation: freezed == expectation
          ? _value.expectation
          : expectation // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillRubricModelImplCopyWith<$Res>
    implements $SkillRubricModelCopyWith<$Res> {
  factory _$$SkillRubricModelImplCopyWith(_$SkillRubricModelImpl value,
          $Res Function(_$SkillRubricModelImpl) then) =
      __$$SkillRubricModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? expectation, String? description});
}

/// @nodoc
class __$$SkillRubricModelImplCopyWithImpl<$Res>
    extends _$SkillRubricModelCopyWithImpl<$Res, _$SkillRubricModelImpl>
    implements _$$SkillRubricModelImplCopyWith<$Res> {
  __$$SkillRubricModelImplCopyWithImpl(_$SkillRubricModelImpl _value,
      $Res Function(_$SkillRubricModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillRubricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expectation = freezed,
    Object? description = freezed,
  }) {
    return _then(_$SkillRubricModelImpl(
      expectation: freezed == expectation
          ? _value.expectation
          : expectation // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillRubricModelImpl implements _SkillRubricModel {
  _$SkillRubricModelImpl({this.expectation, this.description});

  factory _$SkillRubricModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillRubricModelImplFromJson(json);

  @override
  final String? expectation;
  @override
  final String? description;

  @override
  String toString() {
    return 'SkillRubricModel(expectation: $expectation, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillRubricModelImpl &&
            (identical(other.expectation, expectation) ||
                other.expectation == expectation) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, expectation, description);

  /// Create a copy of SkillRubricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillRubricModelImplCopyWith<_$SkillRubricModelImpl> get copyWith =>
      __$$SkillRubricModelImplCopyWithImpl<_$SkillRubricModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillRubricModelImplToJson(
      this,
    );
  }
}

abstract class _SkillRubricModel implements SkillRubricModel {
  factory _SkillRubricModel(
      {final String? expectation,
      final String? description}) = _$SkillRubricModelImpl;

  factory _SkillRubricModel.fromJson(Map<String, dynamic> json) =
      _$SkillRubricModelImpl.fromJson;

  @override
  String? get expectation;
  @override
  String? get description;

  /// Create a copy of SkillRubricModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillRubricModelImplCopyWith<_$SkillRubricModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
