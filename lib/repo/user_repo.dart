import 'package:dartz/dartz.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cahce_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/functions/upload_image_to_api.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/models/sign_in_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/models/sign_up_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/models/update_user.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserrepoImpel {
  final APIConsumer api;
  UserrepoImpel({required this.api});

  Future<Either<String, SignInModel>> signIn(
      String email, String password) async {
    try {
      final response = await api.post(
        Endpoint.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );

      final user = SignInModel.fromJson(response);
      final overallDecodedToken = JwtDecoder.decode(user.token);

      CacheHelper().saveData(key: ApiKey.token, value: user.token); // فالهيدر

      CacheHelper()
          .saveData(key: ApiKey.id, value: overallDecodedToken[ApiKey.id]);
      return right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    XFile? profilePic, // جعل الصورة اختيارية
  }) async {
    try {
      final response = await api.post(
        Endpoint.signUp,
        isFormData: true,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.phone: phone,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassword,
          ApiKey.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKey.profilePic: profilePic != null
              ? await uploadImageToAPI(profilePic)
              : 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vecteezy.com%2Ffree-photos%2Fmen&psig=AOvVaw0jp6o54Vegoyw3hJoo2q1E&ust=1727275890367000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLDJgKHq24gDFQAAAAAdAAAAABAE', // الحالة الافتراضية إذا لم تكن الصورة موجودة
        },
      );
      final signupmodel = SignUpModel.fromJson(response);
      return right(signupmodel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, GetUserModel>> getUserProfile() async {
    try {
      final response = await api.get(
        Endpoint.getUserDataEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      // تحويل الـ response إلى GetUserModel
      final getUserModel = GetUserModel.fromJson(response);

      return right(getUserModel);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, UpdateUserModel>> updateUser(
      Map<String, dynamic> userData) async {
    try {
      // إرسال بيانات التحديث كـ Map
      final response = await api.patch(
        Endpoint.updateuser,
        isFormData: true,
        data: userData, // هنا ترسل بيانات المستخدم المعدلة
      );

      // التأكد من أن حالة الاستجابة هي 200
      if (response.statusCode == 200) {
        // تحويل الـ response إلى UpdateUserModel
        return Right(UpdateUserModel.fromJson(response.data));
      } else {
        // إرجاع رسالة الخطأ إذا لم تكن الاستجابة 200
        return Left(response.data['message'] ?? 'حدث خطأ غير معروف');
      }
    } on ServerException catch (error) {
      // معالجة الأخطاء
      return Left(error.errorModel.errorMessage);
    }
  }
  // Future<Either<String, UpdateUserModel>> updateUser(
  //     Map<String, dynamic> userData) async {
  //   try {
  //     // إرسال بيانات التحديث كـ Map
  //     final response = await api.patch(
  //       Endpoint.updateuser,
  //       isFormData: true,
  //       data: {
  //         // ApiKey.email: email,
  //         // ApiKey.password: password,
  //       },
  //     );

  //     // التأكد من أن حالة الاستجابة هي 200
  //     if (response.statusCode == 200) {
  //       // تحويل الـ response إلى UpdateUserModel
  //       return Right(UpdateUserModel.fromJson(response.data));
  //     } else {
  //       // إرجاع رسالة الخطأ إذا لم تكن الاستجابة 200
  //       return Left(response.data['message'] ?? 'حدث خطأ غير معروف');
  //     }
  //   } on ServerException catch (error) {
  //     // معالجة الأخطاء
  //     return Left(error.errorModel.errorMessage);
  //   }
  // }
}
