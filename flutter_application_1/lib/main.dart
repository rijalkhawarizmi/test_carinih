import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/bloc/auth/auth_cubit.dart';
import 'package:flutter_application_1/data/bloc/crud_sqflite/crud_sqflite_cubit.dart';
import 'package:flutter_application_1/data/bloc/fetch_user/fetch_user_cubit.dart';
import 'package:flutter_application_1/data/bloc/shared_pref/shared_pref_cubit.dart';
import 'package:flutter_application_1/presentation/pages/login_page.dart';
import 'package:flutter_application_1/presentation/pages/register_page.dart';
import 'package:flutter_application_1/presentation/pages/root.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //mainn
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(),
        ),
        BlocProvider(
          create: (_) => SharedPrefCubit(),
        ),
        BlocProvider(
          create: (_) => FetchUserCubit(),
        ),
        BlocProvider(
          create: (_) => CrudSqfliteCubit(),
        ),
      ],
      child: MaterialApp(
        home: RootPage(),
      ),
    );
  }
}
