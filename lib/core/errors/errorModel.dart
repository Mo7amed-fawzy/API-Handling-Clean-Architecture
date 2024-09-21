class ErrorModel {
// بستقبل ملف الجسون هنا عشان شغال ايبياي
// والمثال المعاه جاييلو الحاجتين دول
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  //  بنعملهم فاكتوري كونستركتور ودا مربط الفرس البيحول ملف الجسون لداتا اقدر اتعامل معاها
  // والفلباراميترز دي الارجيومنت بتاعت الجسون بستقبلو كدا
  factory ErrorModel.fromjson(Map<String, dynamic> jsonData) {
    // جسونداتا دا اسم
    return ErrorModel(
        // بعمل ريتيرن للجسون بعد متخزن فيه الداتا
        status: jsonData["status"],
        errorMessage: jsonData[
            "ErrorMessage"]); // هنا باخد منو الكيي ولازم يكون نفس الاسم الفل ايبياي
  }
}
