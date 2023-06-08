import 'package:curso_flutter_avancado/app/app_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../app/constant.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory{

  AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    int _timeOut = 60*1000; // 1 min

    String language = await _appPreferences.getAppLanguage();

    Map<String, String> headers = {
      CONTENT_TYPE:APPLICATION_JSON,
      ACCEPT:APPLICATION_JSON,
      AUTHORIZATION:Constant.token,
      DEFAULT_LANGUAGE:language // identifica a lingua do sistema
    };

    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: _timeOut,
      receiveTimeout: _timeOut,
      headers: headers
    );

    if(kReleaseMode){
      print("release mode no logs");
    }else{
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}