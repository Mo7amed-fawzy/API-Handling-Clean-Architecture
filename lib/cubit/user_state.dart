class UserState {}

final class UserInitial extends UserState {}

final class UserSignInSuccess extends UserState {}

final class UploadProfilePicture extends UserState {}

final class UserSignInLoading extends UserState {}

final class UserSignInFailure extends UserState {
  final String errMessage;

  UserSignInFailure({required this.errMessage});
}

final class UserSignUpSuccess extends UserState {
  final String message;
  UserSignUpSuccess({required this.message});
}

final class UserSignUpLoading extends UserState {}

final class UserSignUpFailure extends UserState {
  final String errMessage;

  UserSignUpFailure({required this.errMessage});
}
