import 'package:flutter/material.dart';
import 'package:flutter_application_1/external/color_helper.dart';
import 'package:flutter_application_1/external/shared_pref.dart';
import 'package:flutter_application_1/external/sizedbox_helper.dart';
import 'package:flutter_application_1/presentation/pages/crud_local_page/page/home.dart';
import 'package:flutter_application_1/presentation/pages/login_page.dart';
import 'package:flutter_application_1/presentation/pages/random_user_page.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selamat datang',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SpaceHelper.verticalSpaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildIcon(context,
                    title: 'API', icon: FontAwesomeIcons.building, onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return RandomUserPage();
                  }));
                }),
                buildIcon(context,
                    title: 'Crud Local',
                    icon: FontAwesomeIcons.newspaper, onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return CrudLocalPage();
                  }));
                }),
                buildIcon(context,
                    title: 'Log out',
                    icon: FontAwesomeIcons.userCircle, onPress: () {
                  SharedPref().deleteDataModel();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (c) {
                    return LoginPage();
                  }), (route) => false);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIcon(context,
      {required String title,
      required IconData icon,
      required VoidCallback onPress}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
            color: kColorWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(blurRadius: 1, offset: Offset(1, 2), color: kColorGrey)
            ]),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: kColorBlue,
            ),
            SpaceHelper.verticalSpaceVerySmall,
            Text(
              '$title',
            )
          ],
        ),
      ),
    );
  }
}
