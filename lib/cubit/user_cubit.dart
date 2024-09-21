import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api_Consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:image_picker/image_picker.dart';

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

  signIn() async {
    // دي بوست ريكويست -ابعت يتشك عليها ويرجع توكن لو كانت الداتا صح
    try {
      emit(UserSignInLoading());
      final respons = await api.post(
        "https://food-api-omega.vercel.app/api/v1/user/signin",
        // دا لينك الايبياي البستعمله + ببعت البادي الهو داتا
        data: {
          "email": signInEmail.text,
          "password": signInPassword.text,
        },
      );
      emit(UserSignInSuccess());
      // ignore: avoid_print
      print(respons);
    } catch (e) {
      emit(UserSignInFailure(errMessage: e.toString()));
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
