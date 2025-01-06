import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/cubit/user_cubit.dart';
import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/cubit/user_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state is GetUserSuccess ? Text(state.user.name) : null,
            actions: [
              IconButton(
                icon: state is UpdateUserModifying
                    ? const Icon(
                        Icons.cancel) // أيقونة علامة الإلغاء عند التعديل
                    : const Icon(
                        Icons.edit), // أيقونة التعديل في الحالة العادية
                onPressed: () {
                  // if (state is UpdateUserModifying) {
                  //   // العودة إلى الحالة الأصلية
                  //   BlocProvider.of<UserCubit>(context)
                  //       .emit(GetUserSuccess(state.user));
                  // } else {
                  //   // الانتقال إلى حالة UpdateUserModifying
                  //   BlocProvider.of<UserCubit>(context)
                  //       .emit(UpdateUserModifying(state.user));
                  // }
                },
              ),
            ],
          ),
          body: state is GetUserLoading
              ? const Center(child: CircularProgressIndicator())
              : state is GetUserSuccess
                  ? ListView(
                      children: [
                        const SizedBox(height: 16),
                        //! Profile Picture
                        CircleAvatar(
                          radius: 80,
                          child: Image.asset("assets/images/avatar.png"),
                          // backgroundImage: NetworkImage(state.user.profilePic),
                        ),
                        const SizedBox(height: 16),

                        //! Name
                        // ListTile(
                        //   title: Text(state.user.name),
                        //   leading: const Icon(Icons.person),
                        // ),
                        const SizedBox(height: 16),

                        //! Email
                        ListTile(
                          title: Text(state.user.email),
                          leading: const Icon(Icons.email),
                        ),
                        const SizedBox(height: 16),

                        //! Phone number
                        ListTile(
                          title: Text(state.user.phone),
                          leading: const Icon(Icons.phone),
                        ),
                        const SizedBox(height: 16),

                        //! Address
                        ListTile(
                          title: Text(state.user.address['type']),
                          leading: const Icon(Icons.location_city),
                        ),
                        const SizedBox(height: 16),
                      ],
                    )
                  : Container(
                      color: Colors.red,
                      child: const Text('Sorry'),
                    ),
        );
      },
    );
  }
}
