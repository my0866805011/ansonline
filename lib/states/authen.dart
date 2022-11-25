import 'package:ansonline/utility/SetConfig.dart';
import 'package:ansonline/widgets/shw_title.dart';
import 'package:flutter/material.dart';

import '../widgets/show_image.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
          behavior: HitTestBehavior.opaque,
          child: ListView(
            children: [
              newMethod(size),
              appName(),
              userMethod(size),
              passwordMethod(size),
              logIn(size),
              createAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Row createAccount() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowTitle(
                  title: 'Non Account ? ',
                  textStyle: Static_val().h3Style(),
                ),
                TextButton(
                  onPressed: ()=>Navigator.pushNamed(context,
                  Static_val.routeCreate),
                  child: const Text('Create Account'),
                ),
              ],
            );
  }

  Row logIn(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: ElevatedButton(
            style: Static_val().myButtonStyle(),
            onPressed: () {},
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }

  Row userMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: Static_val().h3Style(),
              labelText: 'User :',
              prefixIcon: Icon(Icons.account_circle, color: Static_val.light),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row passwordMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEye = !statusRedEye;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Static_val.dart,
                  )),
              labelStyle: Static_val().h3Style(),
              labelText: 'Password :',
              prefixIcon: Icon(Icons.lock_outline, color: Static_val.light),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row appName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: Static_val.appName,
          textStyle: Static_val().h1Style(),
        ),
      ],
    );
  }

  Row newMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: ShowImage(path: Static_val.image4),
        ),
      ],
    );
  }
}
