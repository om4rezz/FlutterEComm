import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppRedirectionButton extends StatelessWidget {
  final String phoneNumber;
  final String message;
  final String productName;
  final String productImageURL;

  WhatsAppRedirectionButton(
      {required this.phoneNumber,
      required this.message,
      required this.productName,
      required this.productImageURL});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _launchWhatsApp,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          fixedSize: Size(200, 50),
        ),
        child: const Text(
          "تواصل معنا",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _launchWhatsApp() async {
    //String url = "https://wa.me/$phoneNumber/?text=${Uri.encodeComponent("Hello, this is a test message. $productImageURL")}&media=${Uri.encodeComponent("image/*,$productImageURL")}";
    String whatsappURl_android = "whatsapp://send?phone=" +
        phoneNumber + "&text=${Uri.encodeComponent("$message $productName $productImageURL")}";
    String url =
        "https://wa.me/$phoneNumber/?text=${Uri.encodeComponent("$message $productName $productImageURL")}";
    if (Platform.isIOS) {
      // iOS
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false);
      } else {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      // android
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    }
  }
}
