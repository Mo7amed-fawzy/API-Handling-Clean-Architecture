import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/cache/cahce_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/core/dio_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/cubit/user_cubit.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/repo/user_repo.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/screens/sign_in_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) =>
          UserCubit(UserrepoImpel(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
