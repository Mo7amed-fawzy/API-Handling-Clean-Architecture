import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/presentation/cubit/user_cubit.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/presentation/screens/user_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelperCA().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => UserCubit()..eitherFailureOrUser(1),
        // اول ميبدا يفتح الابلكيشن يعملي ريكويست وحدو منغير مدوس لليوزر رقم 1
        child: const UserScreen(),
      ),
    );
  }
}
