import 'package:dio/dio.dart';

// بعمل دا عشان اتحكم فالريكويست وهو رايح وفالريسبونس وهو راجع والايرور كمان (راجل مرور)
class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['token'] = 'خلص شغلك بسرعة';
    options.headers['Accepte-Language'] = 'ar';
    super.onRequest(options, handler);
  }
}
// في 3 مثودز في
  // onRequest ودي بيراقب الريكويست واقدر اخليه يعمل حاجه مع الريكويست وهو رايح
  // onResponse onError نفس الكلام علي دور برضه