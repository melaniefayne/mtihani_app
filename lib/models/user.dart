// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtihani_app/models/class.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    int? user_id,
    String? email,
    String? name,
    String? role,
    int? teacher_id,
    int? student_id,
    String? phone_no,
    String? code,
    List<ClassModel>? user_classes,
    DateTime? created_at,
    DateTime? updated_at,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
