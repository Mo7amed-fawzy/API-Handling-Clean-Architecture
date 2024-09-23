import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cahce_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api_Consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/functions/upload_image_to_api.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/models/sign_in_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/models/sign_up_model.dart';
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
  XFile? profilePic; // هخزن فيه الصوره بتعتي
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
      //يحتوي على معلومات المستخدم التي تم استرجاعها من السيرفر بعد تسجيل الدخول

      // خدلي من المودل التوكن واعمله ديكود عشان اوصل للاي دي
      final overallDecodedToken = JwtDecoder.decode(user!.token);
      //يحتوي على عدة بيانات مخزنة داخل التوكن.

      // بعد مفكيتو خزنت التوكن فالكاشهيلبر
      CacheHelper().saveData(key: ApiKey.token, value: user!.token); // فالهيدر
      // فاليو التكون جاي فالمودل علشان جاي للحاجه الكبيره
      // وكمان خزنت الايدي عشان ابدا استخدمه
      CacheHelper().saveData(
          key: ApiKey.id,
          value: overallDecodedToken[ApiKey.id]); // كويريباراميتر
      // فاليو الايدي جاي من التشفير علشان حتة من الحاجة الكبيره
      // بعد تسجيل الدخول الناجح التوكن راح الشيرد بريفرانسيز واتخزن عشان ابدا استخدمه
      emit(UserSignInSuccess());
    } on ServerException catch (e) {
      emit(UserSignInFailure(errMessage: e.errorModel.errorMessage));
    }
  }

  uploadProfilePicture(XFile image) {
    profilePic = image;
    emit(UploadProfilePicture());
  }

  signUp() async {
    try {
      emit(UserSignUpLoading());
      final response = await api.post(
        Endpoint.signUp,
        isFormData: true,
        data: {
          ApiKey.name: signUpName.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.phone: signUpPhoneNumber.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.confirmPassword: confirmPassword.text,
          ApiKey.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKey.profilePic: await uploadImageToAPI(profilePic!),
        },
      );
      final signupmodel = SignUpModel.fromJson(response);
      emit(UserSignUpSuccess(message: signupmodel.message));
    } on ServerException catch (e) {
      emit(UserSignUpFailure(errMessage: e.errorModel.errorMessage));
    }
  }
}
