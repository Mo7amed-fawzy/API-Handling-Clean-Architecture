class UserState {}

final class UserInitial extends UserState {}

final class UserSignInSuccess extends UserState {}

final class UserSignInLoading extends UserState {}

final class UserSignInFailure extends UserState {
  final String errMessage;

  UserSignInFailure({required this.errMessage});
}
