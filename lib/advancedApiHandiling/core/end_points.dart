// بعمل كلاس بحط فيه كل السترنج بتعتي
class Endpoint {
  static String basUrl = "https://food-api-omega.vercel.app/api/v1/";
  static String signIn = "user/signin";
  static String signUp = "user/signup";
  static String getUserDataEndPoint(id) {
    return 'user/get-user/$id';
  }

  static String updateuser = "user/update";
}

class ApiKey {
  static String status = "status";
  static String errorMessag = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token"; // هفك تشفيرو ويبقي عندي ايدي
  static String message = "message";
  static String id = "id";

  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
}
