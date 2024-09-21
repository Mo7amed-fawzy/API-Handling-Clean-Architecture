abstract class APIConsumer {
  // الحجات دي فيوتشر عشان هتاخد وقت عبال متيجي من الاي بي اي والريتيرن بتاعها داينامك
  Future<dynamic> get(String path,
      // الجوا القوس دي حجات اوبشنال
      {Object? data, // الهي البادي
      Map<String, dynamic>? queryparameters});

  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>?
        queryparameters, // كدا عندي اوبشن ياما ابعت الداتا جسون داتا
    // هنا دول علشان ببعت فا هعملهم الاضافه دي
    bool isFormData = false, // او ابعتهم فورم داتا
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
