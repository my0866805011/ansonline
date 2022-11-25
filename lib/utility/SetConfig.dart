import 'package:flutter/material.dart';

// ignore: camel_case_types
class Static_val {
  static String appName = 'AnsOnline';

//Route
  static String routeAuthen = '/authen';
  static String routeCreate = '/createAccount';
  static String routeBuyer = '/buyerService';
  static String routeSale = '/saleService';
  static String routerider = '/rideService';

// Image
  static String image1 = 'assets/images/1.png';
  static String image2 = 'assets/images/2.png';
  static String image3 = 'assets/images/3.png';
  static String image4 = 'assets/images/4.png';

//Color
  static Color primary = const Color(0xff87861d);
  static Color dart = const Color(0xff575900);
  static Color light = const Color(0xffb9b64e);

// Style
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: dart,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dart,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dart,
        fontWeight: FontWeight.normal,
      );
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
