import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cahce_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/end_points.dart';

// بعمل دا عشان اتحكم فالريكويست وهو رايح وفالريسبونس وهو راجع والايرور كمان (راجل مرور)
class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['token'] = 'خلص شغلك بسرعة';
    // options.headers['Accepte-Language'] = 'ar';
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null // لو موجود
            ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}' // زي هناك
            : null;
    super.onRequest(options, handler);
  }
}
// في 3 مثودز في
// onRequest ودي بيراقب الريكويست واقدر اخليه يعمل حاجه مع الريكويست وهو رايح
// onResponse onError نفس الكلام علي دور برضه
