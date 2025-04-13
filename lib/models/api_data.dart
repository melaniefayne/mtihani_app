import 'package:mtihani_app/models/api_error.dart';

const String dataKeyWord = "results";

class ApiDataModel<T> {
  ApiErrorModel? apiError;
  T? data;
  List<T>? listData;
  int? count;
  String? next;
  String? previous;

  ApiDataModel({
    this.apiError,
    this.data,
    this.listData,
    this.count,
    this.next,
    this.previous,
  });

  ///[ApiDataModel.fromJson]
  /// dataFromJson: convert object; listDataFromJson: convert list of objects
  factory ApiDataModel.fromJson({
    required Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? dataFromJson,
    T Function(Map<String, dynamic>)? listDataFromJson,
    String? dataField,
  }) {
    var listRes = listDataFromJson == null
        ? null
        : dataField == null
            ? json
            : json[dataField];
    Map<String, dynamic>? listJson = listRes is List<dynamic> ? null : listRes;

    return ApiDataModel<T>(
      apiError: ApiErrorModel.fromJson(json),
      data: dataFromJson == null
          ? null
          : dataField != null
              ? dataFromJson(json[dataField])
              : dataFromJson(json),
      listData: listDataFromJson == null
          ? null
          : ((listJson == null ? listRes : listJson[dataKeyWord])
                  as List<dynamic>?)
              ?.map((e) => listDataFromJson(e as Map<String, dynamic>))
              .toList(),
      count: listJson?['count'] as int?,
      next: listJson?['next'] as String?,
      previous: listJson?['previous'] as String?,
    );
  }
}
