import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/cubit/user_cubit.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/screens/profile_screen.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/widgets/custom_form_button.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/widgets/custom_input_field.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/widgets/dont_have_an_account.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/widgets/forget_password_widget.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/widgets/page_header.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/widgets/page_heading.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSignInSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Success")));

          context.read<UserCubit>().getUserProfile();
          // هعمل جيت للداتا

          if (kDebugMode) {
            print('انا دخلت علي تسجيل الدخول');
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        } else if (state is UserSignInFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffEEF1F3),
          body: Column(
            children: [
              const PageHeader(),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: context.read<UserCubit>().signInFormKey,
                      child: Column(
                        children: [
                          const PageHeading(title: 'Sign-in'),
                          //!Email
                          CustomInputField(
                            labelText: 'Email',
                            hintText: 'Your email',
                            controller: context.read<UserCubit>().signInEmail,
                          ),
                          const SizedBox(height: 16),
                          //!Password
                          CustomInputField(
                            labelText: 'Password',
                            hintText: 'Your password',
                            obscureText: true,
                            suffixIcon: true,
                            controller:
                                context.read<UserCubit>().signInPassword,
                          ),
                          const SizedBox(height: 16),
                          //! Forget password?
                          ForgetPasswordWidget(size: size),
                          const SizedBox(height: 20),
                          //!Sign In Button
                          state is UserSignInLoading // لما هي تكون فحالة اللودنج
                              ? const CircularProgressIndicator()
                              : CustomFormButton(
                                  innerText: 'Sign In',
                                  onPressed: () {
                                    context.read<UserCubit>().signIn();
                                  },
                                ),
                          const SizedBox(height: 18),
                          //! Dont Have An Account ?
                          DontHaveAnAccountWidget(size: size),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
