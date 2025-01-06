import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/core/models/sign_in_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/repo/user_repo.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userreop) : super(UserInitial());

  final UserrepoImpel userreop;

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
    emit(UserSignInLoading());
    final response =
        await userreop.signIn(signInEmail.text, signInPassword.text);
    response.fold(
      (errMessage) => emit(UserSignInFailure(errMessage: errMessage)),
      (signInModel) => emit(UserSignInSuccess()),
    );
  }

  uploadProfilePicture(XFile image) {
    profilePic = image;
    emit(UploadProfilePicture());
  }

  signUp() async {
    emit(UserSignUpLoading());
    final response = await userreop.signUp(
      name: signUpName.text,
      email: signUpEmail.text,
      phone: signUpPhoneNumber.text,
      password: signUpPassword.text,
      confirmPassword: confirmPassword.text,
      // profilePic: profilePic!
    );
    response.fold(
      (errMessage) => emit(UserSignUpFailure(errMessage: errMessage)),
      (signUpModel) => emit(UserSignUpSuccess(message: signUpModel.message)),
    );
  }

  getUserProfile() async {
    emit(GetUserLoading());
    final response = await userreop.getUserProfile();
    response.fold(
      (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
      (userdataget) => emit(GetUserSuccess(user: userdataget)),
    );
  }

  // void toggleEditMode() {
  //   if (state is GetUserSuccess) {
  //     final user = (state as GetUserSuccess).user;
  //     emit(UpdateUserModifying(user: user));
  //   } else if (state is UpdateUserModifying) {
  //     final user = (state as UpdateUserModifying).user;
  //     emit(GetUserSuccess(user: user));
  //   }
  // }

  // void updateUserField(String field, String value) {
  //   if (state is UpdateUserModifying) {
  //     final user = (state as UpdateUserModifying).user;
  //     emit(UpdateUserModifying(
  //       user: user.copyWith(
  //         name: field == 'name' ? value : user.name,
  //         email: field == 'email' ? value : user.email,
  //         phone: field == 'phone' ? value : user.phone,
  //       ),
  //     ));
  //   }
  // }

  // void fetchUserData() async {
  //   emit(GetUserLoading());
  //   final response = await userreop.getUserProfile();
  //   response.fold(
  //     (errorMessage) {
  //       emit(GetUserFailure(
  //         errMessage: errorMessage,
  //       ));
  //     },
  //     (user) {
  //       emit(GetUserSuccess(user: user));
  //     },
  //   );
  // }

  // void updateUserData(Map<String, dynamic> userData) async {
  //   emit(UpdateUserDataLoading());
  //   final response = await userreop.updateUser(userData);
  //   response.fold(
  //     (errorMessage) {
  //       emit(UpdateUserDataFailure(errorMessage: errorMessage));
  //     },
  //     (updatedUser) {
  //       // إعادة تحميل البيانات بعد نجاح التحديث
  //       fetchUserData(); // إضافة هذه السطر
  //     },
  //   );
  // }
  // updateUserData() async {
  //   emit(UpdateUserDataLoading());

  //   // تحقق مما إذا كانت الحالة الحالية هي UpdateUserModifying
  //   if (state is UpdateUserModifying) {
  //     // استخدم بيانات المستخدم من الحالة
  //     final user = (state as UpdateUserModifying).user;

  //     // استخدام toMap لتحويل المستخدم إلى خريطة
  //     final response = await userreop.updateUser(user.toMap());

  //     response.fold(
  //       (errorMessage) {
  //         emit(UpdateUserDataFailure());
  //         if (kDebugMode) {
  //           print('Error: $errorMessage');
  //         }
  //       },
  //       (updatedUser) {
  //         emit(UpdateUserDataSuccess());
  //         getUserProfile(); // بعد النجاح، يمكنك جلب البيانات الجديدة للمستخدم
  //       },
  //     );
  //   } else {
  //     emit(UpdateUserDataFailure());
  //     if (kDebugMode) {
  //       print('Current state is not UpdateUserModifying');
  //     }
  //   }
  // }
}
  // updateUserData() async {
  //   emit(UpdateUserDataLoading());
  //   //  "email": signInEmail.text,
  //   //  "password": signInPassword.text,
  //   // ignore: unused_local_variable
  //   final modifieduserdata = await userreop.updateUser(
  //     {
  //       ApiKey.name: 'اسم جديد',
  //       ApiKey.email: 'newemail@example.com',
  //       ApiKey.phone: '0123456789',
  //       ApiKey.password: 'newpassword',
  //       ApiKey.confirmPassword: 'newpassword',
  //       ApiKey.profilePic: profilePic != null
  //           ? await uploadImageToAPI(profilePic!)
  //           : null, // إرسال الصورة إذا كانت موجودة
  //     },
  //   );
  //   // emit(UpdateUserModifying());

  //   modifieduserdata.fold(
  //     (errorMessage) {
  //       // التعامل مع الخطأ
  //       if (kDebugMode) {
  //         print('Error: $errorMessage');
  //         emit(UpdateUserDataFailure());
  //       }
  //     },
  //     (updatedUser) {
  //       // التعامل مع المستخدم المحدث
  //       if (kDebugMode) {
  //         print('User updated: ${updatedUser.message}');
  //         emit(UpdateUserDataSuccess());
  //       }
  //     },
  //   );
  // }
//   Map<String, dynamic> updatedUserData = {}; // تعريف هنا
//   void updateUserField(String field, String value) {
//     updatedUserData[field] = value;

//     // استخدام الحالة الحالية للحصول على المستخدم
//     if (state is GetUserSuccess) {
//       final user =
//           (state as GetUserSuccess).user; // الحصول على المستخدم من الحالة

//       // استخدام copyWith مع القيم المحددة
//       emit(UpdateUserModifying(
//         user: user.copyWith(
//           name: updatedUserData['name'] ?? user.name,
//           email: updatedUserData['email'] ?? user.email,
//           phone: updatedUserData['phone'] ?? user.phone,
//           address: updatedUserData['address'] ?? user.address,
//         ),
//       ));
//     }
//   }

//   // دالة لحفظ التعديلات (PATCH request)
//   void patchUser() {
//     if (state is UpdateUserModifying) {
//       // قم بتنفيذ طلب الـ PATCH هنا
//       // مثلا: استدعاء API لإرسال updatedUserData

//       // بعد نجاح التعديل، أعد المستخدم إلى حالة النجاح
//       // مثلا:
//       // emit(UpdateUserSuccess(...)); أو
//       // emit(GetUserSuccess(user: updatedUser));
//     }
//   }
// }
