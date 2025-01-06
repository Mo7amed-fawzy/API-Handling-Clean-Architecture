import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/user_entitiy.dart';

class UserState {}

final class UserInitial extends UserState {}

final class UpdateSLider extends UserState {}

final class GetUserSuccessfully extends UserState {
  final UserEntity user;

  GetUserSuccessfully({required this.user});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}
