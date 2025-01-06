import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/end_point.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // يمكنك إضافة أي منطق آخر هنا إذا كنت ترغب في إضافة معلومات أخرى
    // أو فقط تركها فارغة إذا كنت لا تحتاج لأي تعديلات على الطلب
    printHere("Request URL: ${options.uri}"); // طباعة URL الطلب على سبيل المثال
    super.onRequest(options, handler);
  }
}
