import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/bloc/auth/auth_cubit.dart';
import 'package:flutter_application_1/data/bloc/shared_pref/shared_pref_cubit.dart';
import 'package:flutter_application_1/external/color_helper.dart';
import 'package:flutter_application_1/external/sizedbox_helper.dart';
import 'package:flutter_application_1/presentation/pages/home_page.dart';
import 'package:flutter_application_1/presentation/widgets/inputdecoration.dart';
import 'package:flutter_application_1/presentation/widgets/toast.dart';
import 'package:flutter_application_1/presentation/widgets/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  bool isSee = false;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  checkIsSee() {
    setState(() {
      isSee = !isSee;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  validator: validateEmail,
                  controller: emailController,
                  decoration: inputDecoration('Email')),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: isSee ? false : true,
                validator: validatePass,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: isSee
                      ? IconButton(
                          onPressed: () {
                            checkIsSee();
                          },
                          icon: Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            checkIsSee();
                          },
                          icon: Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.pink)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              SpaceHelper.verticalSpaceMedium,
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthRegisLoading) {
                    ToastWidget().toast('Please Wait', kColorBlue);
                  } else if (state is AuthRegisSuccess) {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (c) {
                      return HomePage();
                    }), (route) => false);
                    SharedPrefCubit sharedPrefCubit =
                        BlocProvider.of<SharedPrefCubit>(context);
                    sharedPrefCubit.shared();
                    ToastWidget().toast('Success', kColorGreenAccent);
                  } else if (state is AuthRegisFailed) {
                    ToastWidget().toast('Failed', kColorPink);
                  }
                },
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      width: double.infinity, height: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        AuthCubit authCubit =
                            BlocProvider.of<AuthCubit>(context);
                        authCubit.doRegister(
                            emailController.text, passwordController.text);
                      }
                    },
                    child: Text('Register'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
