import 'package:curso_flutter_avancado/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

enum DataSource{
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CHACHE_ERROR,
  DEFAULT,
  NI_INTERNNET_CONNECTION
}

class ErrorHandler implements Exception{

  late Failure failure;

  ErrorHandler.handler(dynamic error){
    if(error is DioError){
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error){
    switch(error.type){
      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();

      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();

      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();

      case DioErrorType.response:
        switch(error.response!.statusCode){
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case ResponseCode.UNAUTHORISED:
            return DataSource.UNAUTHORISED.getFailure();
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }

      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();

      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }

}

class ResponseCode{
  // API status codes
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201; //success with no data
  static const int BAD_REQUEST = 400; //failure, api rejected the request
  static const int FORBIDDEN = 403; //failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure user is not authorised
  static const int NOT_FOUND = 404; // failure, api url is not correct
  static const int INTERNAL_SERVER_ERROR = 500; //failure, crash happened in server side

  // local status code
  static const int UNKOWN = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT =  -4;
  static const int SEND_TIMEOUT = -5;
  static const int CHACHE_ERROR =  -6;
  static const int NI_INTERNNET_CONNECTION = -6;
}

class ResponseMessage{
  // API status codes
  static const String SUCCESS = "succes";
  static const String NO_CONTENT = "success with no data"; //success with no data
  static const String BAD_REQUEST = "Bad request, try again later"; //failure, api rejected the request
  static const String FORBIDDEN = "Forbidden request, try again later"; //failure, api rejected the request
  static const String UNAUTHORISED = "Usr is anauthorised, try again later"; // failure user is not authorised
  static const String NOT_FOUND = "Url is not found, try again later"; // failure, api url is not correct
  static const String INTERNAL_SERVER_ERROR = "Something went wrong, try again later"; //failure, crash happened in server side

  // local status code
  static const String UNKOWN = "Something went wrong, try again later";
  static const String CONNECT_TIMEOUT = "Time out error, try again later";
  static const String CANCEL = "Request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT =  "time out error, try again later";
  static const String SEND_TIMEOUT = "Time out error, try again later";
  static const String CHACHE_ERROR =  "Cache error, try again later";
  static const String NI_INTERNNET_CONNECTION = "Please check your internet connection";
}

extension DataSourceExtension on DataSource{
  Failure getFailure(){
    switch(this){
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);

      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);

      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR, ResponseMessage.INTERNAL_SERVER_ERROR);

      case DataSource.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);

      case DataSource.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);

      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);

      case DataSource.RECEIVE_TIMEOUT:
        return Failure(ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);

      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);

      case DataSource.CHACHE_ERROR:
        return Failure(ResponseCode.CHACHE_ERROR, ResponseMessage.CHACHE_ERROR);

      case DataSource.NI_INTERNNET_CONNECTION:
        return Failure(ResponseCode.NI_INTERNNET_CONNECTION, ResponseMessage.NI_INTERNNET_CONNECTION);

      default:
        return Failure(ResponseCode.UNKOWN, ResponseMessage.UNKOWN);

    }

  }
}
