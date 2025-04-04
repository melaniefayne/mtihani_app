// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassModel _$ClassModelFromJson(Map<String, dynamic> json) {
  return _ClassModel.fromJson(json);
}

/// @nodoc
mixin _$ClassModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get school_name => throw _privateConstructorUsedError;
  String? get school_address => throw _privateConstructorUsedError;
  int? get grade => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  int? get teacher_id => throw _privateConstructorUsedError;

  /// Serializes this ClassModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassModelCopyWith<ClassModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassModelCopyWith<$Res> {
  factory $ClassModelCopyWith(
          ClassModel value, $Res Function(ClassModel) then) =
      _$ClassModelCopyWithImpl<$Res, ClassModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? school_name,
      String? school_address,
      int? grade,
      String? code,
      int? teacher_id});
}

/// @nodoc
class _$ClassModelCopyWithImpl<$Res, $Val extends ClassModel>
    implements $ClassModelCopyWith<$Res> {
  _$ClassModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? school_name = freezed,
    Object? school_address = freezed,
    Object? grade = freezed,
    Object? code = freezed,
    Object? teacher_id = freezed,
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
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher_id: freezed == teacher_id
          ? _value.teacher_id
          : teacher_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassModelImplCopyWith<$Res>
    implements $ClassModelCopyWith<$Res> {
  factory _$$ClassModelImplCopyWith(
          _$ClassModelImpl value, $Res Function(_$ClassModelImpl) then) =
      __$$ClassModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? school_name,
      String? school_address,
      int? grade,
      String? code,
      int? teacher_id});
}

/// @nodoc
class __$$ClassModelImplCopyWithImpl<$Res>
    extends _$ClassModelCopyWithImpl<$Res, _$ClassModelImpl>
    implements _$$ClassModelImplCopyWith<$Res> {
  __$$ClassModelImplCopyWithImpl(
      _$ClassModelImpl _value, $Res Function(_$ClassModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? school_name = freezed,
    Object? school_address = freezed,
    Object? grade = freezed,
    Object? code = freezed,
    Object? teacher_id = freezed,
  }) {
    return _then(_$ClassModelImpl(
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
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher_id: freezed == teacher_id
          ? _value.teacher_id
          : teacher_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassModelImpl implements _ClassModel {
  _$ClassModelImpl(
      {this.id,
      this.name,
      this.school_name,
      this.school_address,
      this.grade,
      this.code,
      this.teacher_id});

  factory _$ClassModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? school_name;
  @override
  final String? school_address;
  @override
  final int? grade;
  @override
  final String? code;
  @override
  final int? teacher_id;

  @override
  String toString() {
    return 'ClassModel(id: $id, name: $name, school_name: $school_name, school_address: $school_address, grade: $grade, code: $code, teacher_id: $teacher_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.school_name, school_name) ||
                other.school_name == school_name) &&
            (identical(other.school_address, school_address) ||
                other.school_address == school_address) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.teacher_id, teacher_id) ||
                other.teacher_id == teacher_id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, school_name,
      school_address, grade, code, teacher_id);

  /// Create a copy of ClassModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassModelImplCopyWith<_$ClassModelImpl> get copyWith =>
      __$$ClassModelImplCopyWithImpl<_$ClassModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassModelImplToJson(
      this,
    );
  }
}

abstract class _ClassModel implements ClassModel {
  factory _ClassModel(
      {final int? id,
      final String? name,
      final String? school_name,
      final String? school_address,
      final int? grade,
      final String? code,
      final int? teacher_id}) = _$ClassModelImpl;

  factory _ClassModel.fromJson(Map<String, dynamic> json) =
      _$ClassModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get school_name;
  @override
  String? get school_address;
  @override
  int? get grade;
  @override
  String? get code;
  @override
  int? get teacher_id;

  /// Create a copy of ClassModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassModelImplCopyWith<_$ClassModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
