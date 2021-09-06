import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/bloc/shared_pref/shared_pref_cubit.dart';
import 'package:flutter_application_1/presentation/pages/home_page.dart';
import 'package:flutter_application_1/presentation/pages/login_page.dart';
import 'package:flutter_application_1/presentation/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
     SharedPrefCubit sharedPrefCubit = BlocProvider.of<SharedPrefCubit>(context);
    sharedPrefCubit.shared();
    return BlocListener<SharedPrefCubit, SharedPrefState>(
      listener: (context, state) {
        if (state is SharedPrefNotEmpty) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c){
             return HomePage();
          }), (route) => false);
        } else if (state is SharedPrefEmpty) {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return LoginPage();
          }));
        }
      },
      child: Container(
        color: Colors.white,
      ),
    );
  }
}