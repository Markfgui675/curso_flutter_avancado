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
  NI_INTERNNET_CONNECTION
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
