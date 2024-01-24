class ApiExceptions implements Exception {
  final String message;
  final String prefix;

  ApiExceptions({this.message = "", this.prefix = ""});

  @override
  String toString() => 'message: $message, prefix: $prefix';
}

class InternetException extends ApiExceptions {
  InternetException([String? message]) : super(message: "No Internet");
}

class RequestTimeout extends ApiExceptions {
  RequestTimeout([String? message]) : super(message: "Request Timeout");
}

class ServerException extends ApiExceptions {
  ServerException([String? message]) : super(message: "Internal Server Error");
}

class UnknownError extends ApiExceptions {
  UnknownError([String? message]) : super(message: "An Unknown Error occurred");
}

class RestrictedAccess extends ApiExceptions {
  RestrictedAccess([String? message]) : super(message: "Restricted Access");
}

class InvalidUrlException extends ApiExceptions {
  InvalidUrlException([String? message]) : super(message: "Invalid Url");
}

class UnauthorizedException extends ApiExceptions {
  UnauthorizedException([String? message]) : super(message: "Unauthorized");
}

class InvalidTokenException extends ApiExceptions {
  InvalidTokenException([String? message])
      : super(message: "Auth Token Is Invalid");
}
