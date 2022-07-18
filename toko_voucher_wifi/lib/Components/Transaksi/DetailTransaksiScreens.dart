import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toko_voucher_wifi/Screens/Features/USERS/Transaksi/Transaksi.dart';
import '../../API/RestApi.dart';
import '../../Screens/Features/USERS/Transaksi/DetailTransaksi.dart';
import '../../utils/constants.dart';
import '../../../../Components/Transaksi/TransaksiScreen.dart';
import 'package:toko_voucher_wifi/Response/Transaksi.dart';

class DetailTransaksiScreens extends StatefulWidget {
  @override
  _DetailTransaksiScreens createState() => _DetailTransaksiScreens();
}

class _DetailTransaksiScreens extends State<DetailTransaksiScreens> {
  var detailTransaksi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailTransaksi = DetailTransaksiPage.dataTransaksi['detailTransaksi'];
  }

  Widget getBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 30),
          child: Text(
            "ID ${DetailTransaksiPage.dataTransaksi['_id']}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        // tarok disini
        ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ListView.separated(
              itemCount: detailTransaksi == null ? 0 : detailTransaksi.length,
              shrinkWrap: true,
              primary: false,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5,
                );
              },
              itemBuilder: (context, index) {
                return _detailTransaksi(
                  "$baseUrl/public/images/${detailTransaksi[index]['barang']['gambar']}",
                  detailTransaksi[index]['barang']['namaBarang'],
                  detailTransaksi[index]['barang']['harga'],
                  detailTransaksi[index]['jumlahBeli'],
                  detailTransaksi[index]['subtotal'],
                  index,
                );
              },
            ),
            SizedBox(height: 15.0)
          ],
        ),
        GestureDetector(
                  onTap: () {
                    AwesomeDialog(
                context: context,
                dialogType: DialogType.WARNING,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                title: 'Peringatan',
                desc: "Yakin ingin hapus data transaksi?",
                btnOkOnPress: () async {
                  print("PRINT DETAILTRANSAKSI: "+DetailTransaksiPage.dataTransaksi['_id']);
                  TransaksiResponse.deleteTransaksiResponse(DetailTransaksiPage.dataTransaksi['_id'], context);
                  //TransaksiResponse.deleteTransaksiResponse();
                  //Navigator.pushNamed(context, TransaksiPage.routeName);
                },
                btnOkIcon: Icons.check,
                btnOkColor: kColorTealToSlow,
                btnCancelOnPress: () async {},
                btnCancelIcon: Icons.cancel,
                btnCancelColor: kColorRedSlow,
              ).show();
                  },
                  child: Chip(
                    padding: EdgeInsets.all(0),
                    backgroundColor: kColorRedSlow,
                    avatar: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    label:
                        Text('Hapus data Transaksi', style: TextStyle(color: Colors.white)),
                  ),
                )
      ],
    );
  }

  Widget _detailTransaksi(
      String gambar, String nama, harga, jumlahBeli, subTotal, int index) {
    return FadeInDown(
      duration: Duration(milliseconds: 350 * index),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0.5,
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 25, right: 25, bottom: 25),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 110,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(gambar),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nama,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  CurrencyFormat.convertToIdr(harga, 0),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Jumlah Beli $jumlahBeli',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Total " + CurrencyFormat.convertToIdr(subTotal, 0),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  showHapusAlert(idKeranjang) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
            ),
            title: Text(
              "Hapus Keranjang ?",
              style: TextStyle(fontSize: 24.0),
            ),
            content: Container(
              height: 100,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          TransaksiResponse.deleteTransaksiResponse(idKeranjang, context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kColorRedSlow,
                          // fixedSize: Size(250, 50),
                        ),
                        child: Text(
                          "Submit",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
