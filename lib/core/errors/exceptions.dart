import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/error_model.dart';

class ServerException implements Exception {
  // كريت اكسبشن خاص بيا
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromjson(e.response!.data));
    //بقولو استقبل الريسبونس وهات الداتا منو وحولو من جسون للايرور مودل وانا اهندلو
    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        // بحط المره دي ستاتوس كود عشان هو وصل للسيرفر
        case 400: //bad response
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));
        case 401: //unutilized
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));
        case 403: //forbidden
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));
        case 404: //not found
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));
        case 409: //coefficient
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));
        case 422: //unprocessable entity
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));
        case 504: //Server Exception
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));
      }
  }
}
