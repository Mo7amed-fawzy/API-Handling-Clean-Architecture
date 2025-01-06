import 'dart:convert';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/models/user_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/errors/exceptions.dart';

class UserLocalDataSource {
  final CacheHelperCA cache;
  final String lastUserKey =
      "CachedUser"; // كيي بستعمله لتحديد موقع تخزين بيانات المستخدم داخل الكاش

  UserLocalDataSource({required this.cache});

  // دالة لتخزين بيانات المستخدم في الكاش
  void cachUser(UserModel? userToCach) {
    if (userToCach != null) {
      cache.saveData(
        key: lastUserKey,
        value: json.encode(
          userToCach.toJson(), // تحويل كائن المستخدم إلى JSON باستخدام toJson
        ),
      );
      // الكيي الهخزن بيه اليوزر بتاعي 'CachedUser'
      // الفاليو مينفعش يكون مودل فبتالي هحتاج احولها لصورة اقدر اقدر اخزنها عندي فالشيرد
      // ف اولا هحولو جسون ومن جسون هعملو اينكود لسترنج لان التخزين بيكون بشكل سترنج
      // وبعدين وانا بجيب اليوزر بحولو من سترنج ل مودل تاني
    } else {
      throw CacheException(errorMessage: 'No Internet Connection');
    }
  }

  // دالة لاسترجاع آخر مستخدم من الكاش
  Future<UserModel> getLastUser() {
    // تحويل JSON إلى كائن UserModel باستخدام الدالة UserModel.fromJson()
    final String? jsonString = cache.getData(key: lastUserKey);

    if (jsonString != null) {
      return Future.value(
        UserModel.fromJson(
          jsonDecode(jsonString), // تحويل JSON إلى Map
        ),
      );
    } else {
      throw CacheException(errorMessage: 'No Internet Connection');
    }
  }
}
