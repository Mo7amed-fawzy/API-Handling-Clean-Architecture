import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException(this.errorModel);
}

class CacheException implements Exception {
  final String errorMessage;
  CacheException({required this.errorMessage});
}

class BadCertificateException extends ServerException {
  BadCertificateException(super.errorModel);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(super.errorModel);
}

class BadResponseException extends ServerException {
  BadResponseException(super.errorModel);
}

class ReceiveTimeoutException extends ServerException {
  ReceiveTimeoutException(super.errorModel);
}

class ConnectionErrorException extends ServerException {
  ConnectionErrorException(super.errorModel);
}

class SendTimeoutException extends ServerException {
  SendTimeoutException(super.errorModel);
}

class UnauthrizedException extends ServerException {
  UnauthrizedException(super.errorModel);
}

class ForbiddenException extends ServerException {
  ForbiddenException(super.errorModel);
}

void handleDioExceptions(DioException e) {
  final data = e.response?.data ?? {};

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(ErrorModel.fromjson(data));

    case DioExceptionType.sendTimeout:
      throw ServerException(ErrorModel.fromjson(data));

    case DioExceptionType.receiveTimeout:
      throw ServerException(ErrorModel.fromjson(data));

    case DioExceptionType.badCertificate:
      throw ServerException(ErrorModel.fromjson(data));

    case DioExceptionType.cancel:
      throw ServerException(ErrorModel.fromjson(data));

    case DioExceptionType.connectionError:
      throw ServerException(ErrorModel.fromjson(data));

    case DioExceptionType.unknown:
      throw ServerException(ErrorModel.fromjson(data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(ErrorModel.fromjson(data));
        case 401:
          throw ServerException(ErrorModel.fromjson(data));
        case 403:
          throw ServerException(ErrorModel.fromjson(data));
        case 404:
          throw ServerException(ErrorModel.fromjson(data));
        case 409:
          throw ServerException(ErrorModel.fromjson(data));
        case 422:
          throw ServerException(ErrorModel.fromjson(data));
        case 504:
          throw ServerException(ErrorModel.fromjson(data));
        default:
          throw ServerException(ErrorModel.fromjson(data));
      }
  }
}
