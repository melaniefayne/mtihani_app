import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/api_data.dart';
import 'package:mtihani_app/models/api_error.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/internet.dart';
import 'package:stacked_services/stacked_services.dart';

final Options _dioGetOptions = Options(
  followRedirects: false,
  validateStatus: (status) {
    return true;
  },
);

///[_preApiCallChecks] returns error or tokenStr, isSuccess, isLogout, isNetConnected
Future<(dynamic, bool, bool, bool)> _preApiCallChecks<T>(
    {bool isGetCall = true}) async {
  bool isInternetConnectionActive = await isInternetConnected();
  if (!isInternetConnectionActive) {
    return (
      ApiDataModel<T>(apiError: ApiErrorModel(message: errorMsgNoInternet)),
      false,
      false,
      false
    );
  }

  final authService = locator<AuthService>();
  var checkTokenRes = await authService.checkValidToken();
  return checkTokenRes.$2
      ? (checkTokenRes.$1, true, false, true)
      : (null, false, true, true);
}

///[onApiGetCall] generic function for basic api GET calls
///return response-message, is-success, is-logged-out, is internet connected
Future<(ApiDataModel<T>?, bool, bool, bool)> onApiGetCall<T>({
  required String getEndpoint,
  T Function(Map<String, dynamic>)? dataFromJson,
  T Function(Map<String, dynamic>)? listDataFromJson,
  Map<String, dynamic>? queryParams,
  String? dataField,
  String? contentType,
}) async {
  try {
    var preCheckRes = await _preApiCallChecks<T>();
    if (!preCheckRes.$2) {
      log("$getEndpoint failed at preCheckRes");
      return preCheckRes as (ApiDataModel<T>?, bool, bool, bool);
    }

    Dio dio = Dio();
    String? tokenStr = preCheckRes.$1;
    if (tokenStr == null) {
      log("$getEndpoint failed at tokenStr == null");
      return (null, false, true, true);
    }

    Options authGetOptions = Options(
      followRedirects: _dioGetOptions.followRedirects,
      validateStatus: _dioGetOptions.validateStatus,
      responseType: _dioGetOptions.responseType,
      contentType: contentType ?? _dioGetOptions.contentType,
      headers: {
        ...?_dioGetOptions.headers,
        apiHeaderAuthorization: tokenTypeBearerWithSpace + tokenStr
      },
    );
    var apiResponse = await dio.get(
      getEndpoint,
      queryParameters: queryParams ?? {},
      options: authGetOptions,
    );

    dev.log("$getEndpoint:::resp==${apiResponse.statusCode}");
    dev.log("$getEndpoint:::queryParams==${queryParams.toString()}");
    // dev.log("$getEndpoint:::resp==${jsonEncode(apiResponse.data)}");
    if (isApiResponseSuccessful(apiResponse.statusCode)) {
      if (apiResponse.data != null) {
        ApiDataModel<T>? respData;
        try {
          if (apiResponse.data is List<dynamic> && listDataFromJson != null) {
            List<dynamic> resList = apiResponse.data
                .map((e) => listDataFromJson(e as Map<String, dynamic>))
                .toList();
            respData = ApiDataModel(
              listData: resList.map((e) => e as T).toList(),
            );
          } else {
            respData = ApiDataModel<T>.fromJson(
              json: apiResponse.data!,
              dataFromJson: dataFromJson,
              listDataFromJson: listDataFromJson,
              dataField: dataField,
            );
          }
        } catch (error) {
          dev.log("$getEndpoint:::error1 == ${error.toString()}");
        }
        if (respData != null) {
          return (respData, true, false, true);
        }
      }
    }

    ///check if 401 unauthorized
    if (isApiResponse401Unauthorized(apiResponse.statusCode)) {
      log("$getEndpoint failed at isApiResponse401Unauthorized");
      return (null, false, true, true);
    }

    if (apiResponse.data != null) {
      ApiDataModel<T> apiError = ApiDataModel.fromJson(json: apiResponse.data);
      return (apiError, false, false, true);
    }
  } catch (error) {
    dev.log("$getEndpoint:::error2 == ${error.toString()}");
  }
  return (null, false, false, true);
}

///[basicApiPOSTCall] generic function for basic api POST calls
///return apiData, is-success, is-logged-out, is internet connected, apiData
Future<(ApiDataModel<T>?, bool, bool, bool, Map<String, dynamic>)>
    onApiPostCall<T>({
  required String postEndpoint,
  dynamic dataMap,
  Map<String, dynamic>? queryParams,
  bool skipTokenCheck = false,
  T Function(Map<String, dynamic>)? dataFromJson,
  T Function(Map<String, dynamic>)? listDataFromJson,
  String? dataField,
  bool isFileDataMap = false,
}) async {
  Map<String, dynamic> apiData = {};
  try {
    String? tokenStr;
    if (skipTokenCheck) {
      bool isInternetConnectionActive = await isInternetConnected();
      if (!isInternetConnectionActive) {
        return (
          ApiDataModel<T>(apiError: ApiErrorModel(message: errorMsgNoInternet)),
          false,
          false,
          false,
          apiData
        );
      }
    } else {
      var preCheckRes = await _preApiCallChecks(isGetCall: false);
      if (!preCheckRes.$2) {
        return (
          preCheckRes.$1 as ApiDataModel<T>?,
          preCheckRes.$2,
          preCheckRes.$3,
          preCheckRes.$4,
          apiData,
        );
      }
      tokenStr = preCheckRes.$1;
      if (tokenStr == null) return (null, false, true, true, apiData);
    }

    Dio dio = Dio();

    Options dioPostOptions = Options(
      contentType: isFileDataMap
          ? Headers.multipartFormDataContentType
          : Headers.jsonContentType,
      responseType: ResponseType.json,
      followRedirects: false,
      headers: skipTokenCheck
          ? {
              apiHeaderContentType: apiContentTypeFormData,
            }
          : {apiHeaderAuthorization: tokenTypeBearerWithSpace + tokenStr!},
      validateStatus: (status) {
        return true;
      },
    );
    dataMap ??= {};
    var apiResponse = await dio.post(
      postEndpoint,
      queryParameters: queryParams ?? {},
      options: dioPostOptions,
      data: isFileDataMap ? FormData.fromMap(dataMap) : dataMap,
    );

    dev.log("$postEndpoint:::queryParams==${queryParams.toString()}");
    dev.log("$postEndpoint:::dataMap==${dataMap.toString()}");
    dev.log("$postEndpoint:::respCode==${apiResponse.statusCode}");
    dev.log("$postEndpoint:::resp==${apiResponse.data}");
    if (apiResponse.data != null) {
      Map<String, dynamic> apiResJson = apiResponse.data is String
          ? jsonDecode(apiResponse.data)
          : apiResponse.data;
      ApiDataModel<T> respData = ApiDataModel<T>.fromJson(
        json: apiResJson,
        dataFromJson: dataFromJson,
        listDataFromJson: listDataFromJson,
        dataField: dataField,
      );
      if (isApiResponseSuccessful(apiResponse.statusCode)) {
        return (respData, true, false, true, apiResJson);
      }
      return (respData, false, false, true, apiData);
    }

    ///GET ERR MSG 2: check if 401 unauthorized
    if (isApiResponse401Unauthorized(apiResponse.statusCode)) {
      return (null, false, true, true, apiData);
    }

    if (apiResponse.data != null) {
      ApiDataModel<T> apiError = ApiDataModel.fromJson(json: apiResponse.data);
      return (apiError, false, false, true, apiData);
    }
  } catch (error) {
    dev.log("$postEndpoint:::error2 == ${error.toString()}");
  }
  return (null, false, false, true, apiData);
}

///[apiCallChecks] returns isSuccess
bool apiCallChecks(dynamic apiCallRes, String title,
    {bool showSuccessMessage = false}) {
  final snackbarService = locator<SnackbarService>();
  final authService = locator<AuthService>();
  if (!apiCallRes.$4) {
    snackbarService.showSnackbar(
      title: 'No Internet!',
      message: errorMsgNoInternet,
      duration: const Duration(seconds: appSnackbarDuration),
    );

    return false;
  }

  if (apiCallRes.$3) {
    authService.onLogoutUser();
    return false;
  }

  String? apiMsg = apiCallRes.$1?.apiError?.message ??
      apiCallRes.$1?.apiError?.error ??
      apiCallRes.$1?.apiError?.detail;

  if (!apiCallRes.$2) {
    snackbarService.showSnackbar(
      title: "Error",
      message: apiMsg ?? "Failed to fetch $title",
      duration: const Duration(seconds: appSnackbarDuration),
    );
    return false;
  }

  if (showSuccessMessage) {
    snackbarService.showSnackbar(
      title: "Success",
      message: apiMsg ?? "Success fetching $title",
      duration: const Duration(seconds: appSnackbarDuration),
    );
  }
  return true;
}

///[onApiGetDocCall] generic function for basic api POST calls
///return apiData, is-success, is-logged-out, is internet connected
Future<(ApiDataModel<Uint8List?>?, bool, bool, bool)> onApiGetDocCall({
  required String docFetchEndpoint,
  required Map<String, dynamic> queryParams,
}) async {
  try {
    String? tokenStr;
    var preCheckRes = await _preApiCallChecks(isGetCall: false);
    if (!preCheckRes.$2) {
      return (null, false, true, true);
    }
    tokenStr = preCheckRes.$1;
    if (tokenStr == null) return (null, false, true, true);

    Dio dio = Dio();
    Options dioPostOptions = Options(
      contentType: Headers.multipartFormDataContentType,
      responseType: ResponseType.bytes,
      followRedirects: false,
      headers: {apiHeaderAuthorization: tokenTypeBearerWithSpace + tokenStr},
      validateStatus: (status) {
        return true;
      },
    );

    var apiResponse = await dio.get(
      docFetchEndpoint,
      queryParameters: queryParams,
      options: dioPostOptions,
    );

    dev.log("$docFetchEndpoint:::queryParams==${queryParams.toString()}");
    dev.log("$docFetchEndpoint:::respCode==${apiResponse.statusCode}");
    // dev.log("$docFetchEndpoint:::data==${apiResponse.data}");

    if (isApiResponseSuccessful(apiResponse.statusCode)) {
      return (
        ApiDataModel(data: apiResponse.data as Uint8List),
        true,
        false,
        true
      );
    }

    if (isApiResponse401Unauthorized(apiResponse.statusCode)) {
      return (null, false, true, true);
    }

    if (apiResponse.data != null) {
      ApiDataModel<Uint8List?> apiError =
          ApiDataModel.fromJson(json: apiResponse.data);
      return (apiError, false, false, true);
    }
  } catch (error) {
    dev.log("onApiGetDocCall:::error2 == ${error.toString()}");
  }
  return (null, false, false, true);
}
