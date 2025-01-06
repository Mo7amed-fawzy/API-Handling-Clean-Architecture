import 'package:flutter/foundation.dart';

class EndPoint {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/";
  static const String user = "users/";
}

printHere(var obj) {
  if (kDebugMode) {
    print(obj);
  }
}

// بنادي عليهم من اسم الكلاس علطول static
class ApiKey {
  static String id = "id";
  static String name = "name";
  static String username = "username";
  static String email = "email";
  static String address = "address";
  static String street = "street";
  static String suite = "suite";
  static String city = "city";
  static String zipcode = "zipcode";
  static String geo = "geo";
  static String lat = "lat";
  static String lng = "lng";
  static String phone = "phone";
  static String website = "website";
  static String company = "company";
  static String companyName = "name";
  static String catchPhrase = "catchPhrase";
  static String bs = "bs";
}
