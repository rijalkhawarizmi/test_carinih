import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  final DATAMODEL = 'dataModel';
  final SAVEFORLOGIN = 'login';
  final PASSWORD = 'password';

  void saveDataModel(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString(DATAMODEL, data);
  }

  void saveForLogin(String email,String pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString(SAVEFORLOGIN, email);
    await sharedPreferences.setString(PASSWORD, pass);
    print(email);
  }

  Future getDataModel() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? pref = sharedPreferences.getString(DATAMODEL);
   

    if (pref == null) {
      return null;
    } else {
      return pref;
    }
  }

  Future getSaveForLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? saveForLogin = sharedPreferences.getString(SAVEFORLOGIN);
    print('hahahaahahah $saveForLogin');

    if (saveForLogin == null) {
      return null;
    } else {
      return saveForLogin;
    }
  }
  Future getPassSaveForLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? saveForLogin = sharedPreferences.getString(PASSWORD);
    print('hahahaahahah $PASSWORD');

    if (saveForLogin == null) {
      return null;
    } else {
      return saveForLogin;
    }
  }

  void deleteDataModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(DATAMODEL);
   
    print("User Model " + prefs.getString(DATAMODEL).toString());
  }
}
