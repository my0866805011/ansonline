import 'dart:io';

import 'package:ansonline/utility/SetConfig.dart';
import 'package:ansonline/widgets/show_image.dart';
import 'package:ansonline/widgets/shw_title.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyDialog {
  Future<Null> alerlocationService(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: Static_val.image4),
          title: ShowTitle(
            title: title,
            textStyle: Static_val().h2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: Static_val().h3Style(),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                await Geolocator.openLocationSettings();
                exit(0);
              },
              child: const Text('OK'))
        ],
      ),
    );
  }

  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(path: Static_val.image1),
          title: ShowTitle(title: title, textStyle: Static_val().h2Style()),
          subtitle:
              ShowTitle(title: message, textStyle: Static_val().h3Style()),
        ),
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Ok'))
        ],
      ),
    );
  }
}
