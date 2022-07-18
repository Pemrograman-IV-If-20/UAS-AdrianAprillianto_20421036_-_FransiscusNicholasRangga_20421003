// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:toko_voucher_wifi/Components/Login/LoginForm.dart';
import 'package:toko_voucher_wifi/Components/default_button_custome_color.dart';
import 'package:toko_voucher_wifi/Screens/Login/LoginScreens.dart';
import 'package:toko_voucher_wifi/size_config.dart';
import 'package:toko_voucher_wifi/utils/constants.dart';

class FrontPageComponent extends StatefulWidget{
  @override
  _FrontPageComponent createState() => _FrontPageComponent();
}

class _FrontPageComponent extends State<FrontPageComponent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
              opacity: 0.3,
              child: Image.asset("assets/images/bg.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
              ),
              ),
              Center(
                child: Column(
                  children: [
                    
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        color: kSecondaryColor,
                        child: Image.asset("assets/images/icon.png", fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    Text(
                            "Kemudahan akses internet", 
                            textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold, 
                            fontSize: 38),
                          ),
                          SizedBox(
                          height: SizeConfig.screenHeight * 0.06,
                    ),
                    Text(
                            "Beli paket Wi-Fi di warung Randi kini mudah hanya\ndalam aplikasi ini! Tidak perlu kembali\nsecara konvensional!", 
                            textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold, 
                            fontSize: 18),
                          ),
                          SizedBox(
                          height: SizeConfig.screenHeight * 0.16, //0.28
                    ),
                          DefaultButtonCustomeColor(
                            color: kPrimaryColor,
                            text: "MULAI",
                            press: () {
                              Navigator.pushNamed(context, LoginScreen.routeName);
                            },
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        
                        child: 
                        Text("    v1.0.0"),
                        
                    )
                  ]
                  ),
                )
          ],
        )
      )

    );
  }
}