class NetworkErrorCode {
  static const int unknown = 0;
  static const int disconection = -1;
  static const int connectTimeout = -2;
  static const int requestCancelled = -3;
  static const int parseError = -4;
  static const int dataNotFound = -5;
  static const int notConnected = -6;
  static const int saveDataFail = -1000;
}

class LoginErrorCode {
  static const int emptyUsername = -100;
  static const int emptyPassword = -101;
}

class DatabaseErrorCode {
  static const int saveFail = -200;
  static const int deleteFail = -201;
}
