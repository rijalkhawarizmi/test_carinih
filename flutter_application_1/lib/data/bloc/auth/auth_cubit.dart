import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/external/shared_pref.dart';
import 'package:meta/meta.dart';
import 'package:crypto/crypto.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  SharedPref sharedPref = SharedPref();

  void doRegister(String email, String password) async {
    emit(AuthRegisLoading());
    try {
      var bytes1 = utf8.encode(password);
      var hashingPassword = sha256.convert(bytes1).toString();
      if (email.isNotEmpty) {
        sharedPref.saveDataModel(email);
        sharedPref.saveForLogin(email, hashingPassword);
        emit(AuthRegisSuccess('Success Register'));
      } else if (email.isEmpty) {
        emit(AuthRegisFailed('Email Already Use'));
      }
    } catch (e) {
      emit(AuthRegisFailed(e.toString()));
    }
  }

  void doLogin(String email, String password) async {
    emit(AuthLoginLoading());
    try {
      var checkEmail = await sharedPref.getSaveForLogin();
      var checkPass = await sharedPref.getPassSaveForLogin();
   var bytes1 = utf8.encode(password);
      var hashingPassword = sha256.convert(bytes1).toString();
      print('astagaaa $checkEmail');
      print(checkPass);
      print(hashingPassword);
      if (email == checkEmail && checkPass==hashingPassword) {
        emit(AuthLoginSuccess('Success'));
      } else {
        emit(AuthLoginFailed('Invalid Email'));
      }
    } catch (e) {
      emit(AuthLoginFailed('Invalid Email'));
    }
  }
}
