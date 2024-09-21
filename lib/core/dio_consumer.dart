import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api_Consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';

class DioConsumer extends APIConsumer {
  final Dio dio;

  DioConsumer({required this.dio});

  @override
  Future delet(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryparameters,
    bool isFormData = false,
  }) async {
    try {
      final response = // الباث دا اللينك
          await dio.delete(path,
              data: isFormData ? FormData.fromMap(data) : data,
              queryParameters: queryparameters);
      return response.data;
    } on DioException catch (e) {
      // بقولو لو حصل دايو اكسبشن
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryparameters}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryparameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryparameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryparameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryparameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryparameters,
      ); // بحولها فورم داتا عشان يتوافق مع الشكل الفقاعدة البيانات
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
