import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toko_voucher_wifi/Components/HomeUsers/HomeUsersScreeens.dart';
import 'package:toko_voucher_wifi/Components/headers_for_home.dart';

import '../../../../Components/Keranjang/Keranjangscreens.dart';
import '../../../../Components/Transaksi/TransaksiScreen.dart';
import '../../../../size_config.dart';

class TransaksiPage extends StatelessWidget {
static String routeName = "/transaksi";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: HeadersForHome("Transaksi"),
        ),
        body: TransaksiScreens()
    );
  }
}
