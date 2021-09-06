import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/bloc/fetch_user/fetch_user_cubit.dart';
import 'package:flutter_application_1/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomUserPage extends StatelessWidget {
  UsersModel? listUserModel;

  @override
  Widget build(BuildContext context) {
    FetchUserCubit fetchUserCubit = BlocProvider.of<FetchUserCubit>(context);
    fetchUserCubit.fetchUser();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<FetchUserCubit, FetchUserState>(
            builder: (context, state) {
              if (state is FetchUserLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FetchUserSuccess) {
                listUserModel = state.usersModel;
              }
              return Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Title'),
                            Text('Name'),
                            Text('First Name'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(':${listUserModel!.name!.title}'),
                            Text(':${listUserModel!.name!.first}'),
                            Text(':${listUserModel!.name!.last}'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
