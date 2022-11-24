import 'package:ansonline/utility/SetConfig.dart';
import 'package:flutter/material.dart';

import '../widgets/show_image.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            newMethod(size),
          ],
        ),
      ),
    );
  }

  Row newMethod(double size) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Container(
        width: size*0.6,
        child: ShowImage(path: Static_val.image4),
       ),
    ],
   );
  }
}
