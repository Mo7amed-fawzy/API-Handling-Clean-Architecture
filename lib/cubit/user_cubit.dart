import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cahce_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api_Consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/models/sign_in_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());

  final APIConsumer api;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  SignInModel? user;

  signIn() async {
    try {
      emit(UserSignInLoading());

      final response = await api.post(
        Endpoint.signIn,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );

      // هبعتلك بوست ريكويست وهبعتلك كذا وكذا ولو الداتا جات بشكل سليم
      //حطلي الريسبونس جوا مودل الهو ساينانمودل
      user = SignInModel.fromJson(response);
      // خدلي من المودل التوكن واعمله ديكود عشان اوصل للاي دي
      final iddecodedToken = JwtDecoder.decode(user!.token);
      // بعد مفكيتو خزنت التوكن فالكاشهيلبر
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      // وكمان خزنت الايدي عشان ابدا استخدمه
      CacheHelper().saveData(key: ApiKey.id, value: iddecodedToken[ApiKey.id]);
      // بعد تسجيل الدخول الناجح التوكن راح الشيرد بريفرانسيز واتخزن عشان ابدا استخدمه
      emit(UserSignInSuccess());
    } on ServerException catch (e) {
      emit(UserSignInFailure(errMessage: e.errorModel.errorMessage));
    }
  }
}


// // دي بوست ريكويست -ابعت يتشك عليها ويرجع توكن لو كانت الداتا صح
//     try {
//       emit(UserSignInLoading());
//       final respons = await api.post(
//         "https://food-api-omega.vercel.app/api/v1/user/signin",
//         // دا لينك الايبياي البستعمله + ببعت البادي الهو داتا
//         data: {
//           "email": signInEmail.text,
//           "password": signInPassword.text,
//         },
//       );
//       emit(UserSignInSuccess());
//       // ignore: avoid_print
//       print(respons);
//     } catch (e) {
//       emit(UserSignInFailure(errMessage: e.toString()));
//       // ignore: avoid_print
//       print(e.toString());
//     }