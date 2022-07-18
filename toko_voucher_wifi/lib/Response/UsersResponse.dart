import 'dart:convert';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toko_voucher_wifi/Screens/Login/LoginScreens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_voucher_wifi/main.dart';
import 'package:toko_voucher_wifi/utils/utils_apps.dart';
import 'package:toko_voucher_wifi/utils/constants.dart';

import '../API/RestApi.dart';
import '../Screens/Features/USERS/HomeUsers.dart';

bool status = false;
int code = 0;
var debug;
var responseJson;
var dataUser = {};
var user = jsonDecode(dataUserLogin);

class LoginResponse {

  static void loginResponse(data, BuildContext context) async {
    
    utilsApps.showDialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    print(jsonEncode(data));
    try {
      final response =
      await http.post(signIn, headers: headers, body: jsonEncode(data));
      debug = response.body.toString();
      responseJson = json.decode(response.body);
      debug = response.body;
      status = responseJson['status'];
      code = responseJson['code'];
      
      if (status == true) {
        dataUser = responseJson['data'];
        print(dataUser);
        sharedPreferences.setString('dataUser', jsonEncode(dataUser));
        sharedPreferences.setBool('login', true);
        sharedPreferences.commit();
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          Navigator.pushNamed(context, HomeUsers.routeName,
              arguments: dataUser);
        });
      } else {
        print(jsonEncode(">> Login debug: "+debug));
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
              context: context,
              dialogType: DialogType.WARNING,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: responseJson['msg'],
              btnOkOnPress: () {},
              btnOkIcon: Icons.cancel,
              btnOkColor: kColorYellow)
              .show();
          // utilsApps.dengerSnack(context, responseJson['message']);
        });
      }
      // print(dataUser);
    } catch (e) {
      print(jsonEncode(">> Login debug: "+debug));
      print(e);
      Future.delayed(Duration(seconds: 1)).then((value) {
        utilsApps.hideDialog(context);
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            title: 'Peringatan',
            desc: "Terjadi kesalahan pada server!",
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: kColorRedSlow)
            .show();
      });
    }
  }

  static void registerResponse(data, BuildContext context) async {
    utilsApps.showDialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    print(jsonEncode(data));
    try {
      final response =
      await http.post(signUp, headers: headers, body: jsonEncode(data));
      debug = response.body.toString();
      responseJson = json.decode(response.body);
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true) {

        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: responseJson['msg'],
              btnOkOnPress: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              btnOkIcon: Icons.check,
              btnOkColor: kPrimaryColor)
              .show();
        });
      } else {
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
              context: context,
              dialogType: DialogType.WARNING,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: responseJson['msg'],
              btnOkOnPress: () {},
              btnOkIcon: Icons.cancel,
              btnOkColor: kColorYellow)
              .show();
          // utilsApps.dengerSnack(context, responseJson['message']);
        });
      }
      // print(dataUser);
    } catch (e) {
      print(jsonEncode(debug));
      print(e);
      Future.delayed(Duration(seconds: 1)).then((value) {
        utilsApps.hideDialog(context);
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            title: 'Peringatan',
            desc: "Terjadi kesalahan pada server\nKode error: "+e.toString(),
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: kColorRedSlow)
            .show();
      });
    }
  }

  //update user
  static void updateUserResponse(id, data, BuildContext context) async {
    utilsApps.showDialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    try {
      final response = await http.put('$updateData/$id',
          headers: headers, body: jsonEncode(data));
      responseJson = json.decode(response.body);
      
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.SUCCES,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan!',
                  desc: responseJson['msg'],
                  btnOkOnPress: () {
                    Navigator.pushNamed(context, HomeUsers.routeName,
                        arguments: {"index": 3});
                  },
                  btnOkIcon: Icons.check,
                  btnOkColor: kPrimaryColor)
              .show();
          // utilsApps.dengerSnack(context, responseJson['message']);
        });
      } else {
        print(">>| " + debug.toString());
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan!!!!',
                  desc: responseJson['msg'],
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.cancel,
                  btnOkColor: kColorYellow)
              .show();
          // utilsApps.dengerSnack(context, responseJson['message']);
        });
      }
      // print(dataUser);
    } catch (e) {
      print(">> " + debug.toString());
      print(e);
      Future.delayed(Duration(seconds: 1)).then((value) {
        utilsApps.hideDialog(context);
        AwesomeDialog(
                context: context,
                dialogType: DialogType.ERROR,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                title: 'Peringatan',
                desc: "Terjadi kesalahan pada server",
                btnOkOnPress: () {},
                btnOkIcon: Icons.cancel,
                btnOkColor: kColorRedSlow)
            .show();
      });
    }
  }
}
