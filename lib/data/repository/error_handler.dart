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
