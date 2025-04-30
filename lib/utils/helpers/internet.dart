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
