import 'package:dio/dio.dart';
import 'package:flu_proj/app/app_prefs.dart';
import 'package:flu_proj/app/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content/type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEAFUL_LANGAUGE = "langauge";

class DioFactory {
  AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String langauge = await _appPreferences.getAppLangauge();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEAFUL_LANGAUGE: langauge,
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
      sendTimeout: const Duration(milliseconds: Constants.apiTimeOut),
    );

    if (kDebugMode) {
      //not release
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseBody: true));
    }
    return dio;
  }
}
