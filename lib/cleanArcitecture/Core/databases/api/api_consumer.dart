abstract class APIConsumer {
  // عامل الملف علشان الباكدج لو ضرب ولا حاجه اكون بستعملو من هنا اصلا
  // الحجات دي فيوتشر والريتيرن بتاعها داينامك
  Future<dynamic> get(String path,
      {Object? data, // الهي البادي
      Map<String, dynamic>? queryparameters});

  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryparameters,
    bool isFormData = false,
  });

  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryparameters,
    bool isFormData = false,
  });

  Future<dynamic> delet(
    String path, {
    Object? data,
    Map<String, dynamic>? queryparameters,
    bool isFormData = false,
  });
}
