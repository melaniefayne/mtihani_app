import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> isInternetConnected() async {
  bool isInternetConnectionActive = false;
  try {
    isInternetConnectionActive =
        await InternetConnectionChecker.createInstance().hasConnection;
  } catch (error) {
    isInternetConnectionActive = false;
  }
  return isInternetConnectionActive;
}

bool isApiResponseSuccessful(int? statusCode) {
  bool isSuccessful = false;
  if (statusCode == null) {
    return isSuccessful;
  }
  if (statusCode >= 200 && statusCode < 300) {
    isSuccessful = true;
  }
  return isSuccessful;
}

bool isApiResponse401Unauthorized(int? statusCode) {
  bool is401Unauthorized = false;
  if (statusCode == null) {
    return is401Unauthorized;
  }
  if (statusCode == 401) {
    is401Unauthorized = true;
  }
  return is401Unauthorized;
}

bool isApiResponse404NotFound(int? statusCode) {
  bool is404NotFound = false;
  if (statusCode == null) {
    return is404NotFound;
  }
  if (statusCode == 404) {
    is404NotFound = true;
  }
  return is404NotFound;
}

bool isApiResponse403Forbidden(int? statusCode) {
  bool is403Forbidden = false;
  if (statusCode == null) {
    return is403Forbidden;
  }
  if (statusCode == 403) {
    is403Forbidden = true;
  }
  return is403Forbidden;
}
