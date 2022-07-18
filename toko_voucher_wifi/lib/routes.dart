import 'package:flutter/cupertino.dart';
import 'package:toko_voucher_wifi/Screens/Features/USERS/HomeUsers.dart';
import 'package:toko_voucher_wifi/Screens/Login/LoginScreens.dart';
import 'Screens/Features/USERS/DetailProduct/DetailScreens.dart';
import 'Screens/Features/USERS/Transaksi/DetailTransaksi.dart';
import 'Screens/Registrasi/RegistrasiScreens.dart';
import 'package:toko_voucher_wifi/Screens/HalamanDepan/HalamanDepanScreens.dart';
import 'package:toko_voucher_wifi/Components/HalamanDepan/FrontPageComponent.dart';


final Map<String, WidgetBuilder> routes = {
  FrontScreen.routeName: (context) => FrontScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegistrasiScreen.routeName: (context) => RegistrasiScreen(),

  //home users
  HomeUsers.routeName: (context) => HomeUsers(),
  DetailProductscreens.routeName: (context) => DetailProductscreens(),
  DetailTransaksiPage.routeName: (context) => DetailTransaksiPage(),
};
