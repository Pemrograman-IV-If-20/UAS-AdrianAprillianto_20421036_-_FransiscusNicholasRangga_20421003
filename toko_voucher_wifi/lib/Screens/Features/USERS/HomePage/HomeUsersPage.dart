import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toko_voucher_wifi/Components/HomeUsers/HomeUsersScreeens.dart';
import 'package:toko_voucher_wifi/Components/headers_for_home.dart';
import 'package:toko_voucher_wifi/main.dart';

import '../../../../size_config.dart';

class HomeUsersPage extends StatelessWidget {
var user = jsonDecode(dataUserLogin);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HeadersForHome("Selamat datang, \n"+user['namaLengkap']+'!'),
      ),
      body: HomeUserComponent()
    );
    
  }
  
}
