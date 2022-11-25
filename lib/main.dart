import 'package:ansonline/states/authen.dart';
import 'package:ansonline/states/buyer_ser.dart';
import 'package:ansonline/states/create_acc.dart';
import 'package:ansonline/states/rider_ser.dart';
import 'package:ansonline/states/saler_ser.dart';
import 'package:ansonline/utility/SetConfig.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => const Authen(),
  '/createAccount': (BuildContext context) => const CreateAcc(),
  '/buyerService': (BuildContext context) => const BuyService(),
  '/saleService': (BuildContext context) => const SalerService(),
  '/riderService': (BuildContext context) => const RiderService(),
};

String? initlalRoute;
void main() {
  initlalRoute = Static_val.routeAuthen;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Static_val.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}