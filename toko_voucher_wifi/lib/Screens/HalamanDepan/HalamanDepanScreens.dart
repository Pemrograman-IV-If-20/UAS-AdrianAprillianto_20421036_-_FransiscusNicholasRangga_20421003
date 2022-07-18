import 'package:flutter/material.dart';
import 'package:toko_voucher_wifi/Components/HalamanDepan/FrontPageComponent.dart';
import 'package:toko_voucher_wifi/size_config.dart';

class FrontScreen extends StatelessWidget {
  static String routeName = "/welcome";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: FrontPageComponent(),
    );
  }
}