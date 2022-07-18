import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toko_voucher_wifi/Screens/Login/LoginScreens.dart';
import 'package:toko_voucher_wifi/Screens/HalamanDepan/HalamanDepanScreens.dart';
import 'package:toko_voucher_wifi/Components/HalamanDepan/FrontPageComponent.dart';
import 'package:toko_voucher_wifi/routes.dart';
import 'package:toko_voucher_wifi/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Features/USERS/HomeUsers.dart';

var dataUserLogin;
bool? login = false;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();
  login = sharedPreferences.getBool("login");
  String defaultRoutes;
  if (login != null) {
    if (login == false) {
      defaultRoutes = FrontScreen.routeName;
    } else {
      dataUserLogin = sharedPreferences.getString("dataUser");
      var data = jsonDecode(dataUserLogin);
      if (data['role'] == 'user') {
        defaultRoutes = HomeUsers.routeName;
      } else {
        defaultRoutes = FrontScreen.routeName;
      }
    }
  } else {
    defaultRoutes = FrontScreen.routeName;
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Wi-Fi Toko Randi',
    theme: theme(),
    initialRoute: defaultRoutes,
    routes: routes,
  ));
  // });
}
